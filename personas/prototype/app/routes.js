// External dependencies
const express = require('express');

const router = express.Router();

// Add your routes here - above the module.exports line

// Journey: Rapid Vital Signs Entry in Overflow Area
router.get('/pages/journey-rapid-vitals-entry', (req, res) => {
	res.render('pages/journey-rapid-vitals-entry/index');
});
router.get('/pages/journey-rapid-vitals-entry/index', (req, res) => {
	res.render('pages/journey-rapid-vitals-entry/index');
});
router.get('/pages/journey-rapid-vitals-entry/patient-list', (req, res) => {
	res.render('pages/journey-rapid-vitals-entry/patient-list');
});
router.get('/pages/journey-rapid-vitals-entry/record-vitals-john', (req, res) => {
	res.render('pages/journey-rapid-vitals-entry/record-vitals-john');
});
router.get('/pages/journey-rapid-vitals-entry/record-vitals-mary', (req, res) => {
	res.render('pages/journey-rapid-vitals-entry/record-vitals-mary');
});
router.get('/pages/journey-rapid-vitals-entry/record-vitals-ali', (req, res) => {
	res.render('pages/journey-rapid-vitals-entry/record-vitals-ali');
});
router.get('/pages/journey-rapid-vitals-entry/vitals-confirm-john', (req, res) => {
	res.render('pages/journey-rapid-vitals-entry/vitals-confirm-john');
});
router.get('/pages/journey-rapid-vitals-entry/vitals-confirm-mary', (req, res) => {
	res.render('pages/journey-rapid-vitals-entry/vitals-confirm-mary');
});
router.get('/pages/journey-rapid-vitals-entry/vitals-confirm-ali', (req, res) => {
	res.render('pages/journey-rapid-vitals-entry/vitals-confirm-ali');
});
router.get('/pages/journey-rapid-vitals-entry/escalate-john', (req, res) => {
	res.render('pages/journey-rapid-vitals-entry/escalate-john');
});
router.get('/pages/journey-rapid-vitals-entry/escalation-confirm-john', (req, res) => {
	res.render('pages/journey-rapid-vitals-entry/escalation-confirm-john');
});

module.exports = router;
