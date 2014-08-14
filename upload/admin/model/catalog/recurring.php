<?php
class ModelCatalogRecurring extends Model {
	public function addRecurring($data) {
		$this->event->trigger('pre_admin_add_recurring', $data);

		$this->db->query("INSERT INTO `" . DB_PREFIX . "recurring` SET `sort_order` = " . (int)$data['sort_order'] . ", `status` = " . (int)$data['status'] . ", `price` = " . (float)$data['price'] . ", `frequency` = '" . $this->db->escape($data['frequency']) . "', `duration` = " . (int)$data['duration'] . ", `cycle` = " . (int)$data['cycle'] . ", `trial_status` = " . (int)$data['trial_status'] . ", `trial_price` = " . (float)$data['trial_price'] . ", `trial_frequency` = '" . $this->db->escape($data['trial_frequency']) . "', `trial_duration` = " . (int)$data['trial_duration'] . ", `trial_cycle` = '" . (int)$data['trial_cycle'] . "'");

		$recurring_id = $this->db->getLastId();

		foreach ($data['recurring_description'] as $language_id => $recurring_description) {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "recurring_description` (`recurring_id`, `language_id`, `name`) VALUES (" . (int)$recurring_id . ", " . (int)$language_id. ", '" . $this->db->escape($recurring_description['name']) . "')");
		}

		$this->event->trigger('admin_add_recurring', $recurring_id);

		return $recurring_id;
	}

	public function editRecurring($recurring_id, $data) {
		$this->event->trigger('pre_admin_edit_recurring', $data);

		$this->db->query("DELETE FROM `" . DB_PREFIX . "recurring_description` WHERE recurring_id = '" . (int)$recurring_id . "'");

		$this->db->query("UPDATE `" . DB_PREFIX . "recurring` SET `sort_order` = " . (int)$data['sort_order'] . ", `status` = " . (int)$data['status'] . ", `price` = " . (float)$data['price'] . ", `frequency` = '" . $this->db->escape($data['frequency']) . "', `duration` = " . (int)$data['duration'] . ", `cycle` = " . (int)$data['cycle'] . ", `trial_status` = " . (int)$data['trial_status'] . ", `trial_price` = " . (float)$data['trial_price'] . ", `trial_frequency` = '" . $this->db->escape($data['trial_frequency']) . "', `trial_duration` = " . (int)$data['trial_duration'] . ", `trial_cycle` = " . (int)$data['trial_cycle'] . " WHERE recurring_id = '" . (int)$recurring_id . "'");

		foreach ($data['recurring_description'] as $language_id => $recurring_description) {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "recurring_description` (`recurring_id`, `language_id`, `name`) VALUES (" . (int)$recurring_id . ", " . (int)$language_id. ", '" . $this->db->escape($recurring_description['name']) . "')");
		}

		$this->event->trigger('admin_edit_recurring');
	}

	public function copyProfile($recurring_id) {
		$data = $this->getProfile($recurring_id);
		
		$data['recurring_description'] = $this->getProfileDescription($recurring_id);

		foreach ($data['recurring_description'] as &$recurring_description) {
			$recurring_description['name'] .= ' - 2';
		}

		$this->addProfile($data);
	}

	public function deleteRecurring($recurring_id) {
		$this->event->trigger('pre_admin_delete_recurring', $recurring_id);

		$this->db->query("DELETE FROM `" . DB_PREFIX . "recurring` WHERE recurring_id = " . (int)$recurring_id);
		$this->db->query("DELETE FROM `" . DB_PREFIX . "recurring_description` WHERE recurring_id = " . (int)$recurring_id);
		$this->db->query("DELETE FROM `" . DB_PREFIX . "product_recurring` WHERE recurring_id = " . (int)$recurring_id);
		$this->db->query("UPDATE `" . DB_PREFIX . "order_recurring` SET `recurring_id` = 0 WHERE `recurring_id` = " . (int)$recurring_id);

		$this->event->trigger('admin_delete_recurring', $recurring_id);
	}

	public function getRecurring($recurring_id) {
		return $this->db->query("SELECT * FROM `" . DB_PREFIX . "recurring` WHERE recurring_id = " . (int)$recurring_id)->row;
	}

	public function getRecurringDescription($recurring_id) {
		$recurring_descriptions = array();

		$results = $this->db->query("SELECT * FROM `" . DB_PREFIX . "recurring_description` WHERE `recurring_id` = '" . (int)$recurring_id . "'");

		foreach ($results as $result) {
			$recurring_descriptions[$result['language_id']] = array('name' => $result['name']);
		}

		return $recurring_descriptions;
	}

	public function getRecurrings($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "recurring` p LEFT JOIN " . DB_PREFIX . "recurring_description pd ON (p.recurring_id = pd.recurring_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (isset($data['filter_name']) && $data['filter_name'] !== null) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sort_data = array(
			'pd.name',
			'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY pd.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalRecurrings() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "recurring`");

		return $query->row['total'];
	}
}