---
marp: true
theme: default
paginate: true
size: 16:9
style: |
  section, section * {
    box-sizing: border-box;
  }

  section {
    display: flex;
    flex-direction: column;
    padding: 0.7rem;
    font-size: 0.8rem;
    height: 100%;
    overflow: hidden;
  }
  
  .persona-header {
    text-align: center;
    margin-bottom: 0.8rem;
    flex-shrink: 0;
  }
  
  .persona-title {
    font-size: 2rem;
    font-weight: bold;
    color: #005eb8;
    margin: 0;
    text-transform: uppercase;
    letter-spacing: 1px;
  }
  
  .persona-subtitle {
    font-size: 0.8rem;
    color: #666;
    margin: 0.2rem 0 0 0;
    text-transform: uppercase;
    letter-spacing: 1px;
  }
  
  .persona-content {
    display: flex;
    gap: 1rem;
    flex: 1;
    min-height: 0;
    align-items: stretch;
    height: 100%;
  }

  .profile-column {
    flex: 0 0 260px;
    display: flex;
    flex-direction: column;
    gap: 0.6rem;
    height: 100%;
    min-height: 0;
    max-height: 100%;
    align-self: stretch;
    overflow: hidden;
  }
  
  .profile-section {
    background: white;
    border: 3px solid #005eb8;
    border-radius: 10px;
    padding: 0.6rem 0.75rem;
    text-align: center;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
    flex: 1 1 0;
    min-height: 0;
    overflow: hidden;
  }
  
  .sample-text {
    font-size: 0.55rem;
    color: #999;
    margin-bottom: 0.4rem;
    background: #f5f5f5;
    padding: 0.1rem 0.3rem;
    border-radius: 3px;
  }
  
  .profile-section img {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    border: 2px solid #005eb8;
    margin: 0 auto;
    flex-shrink: 0;
    object-fit: cover;
  }
  
  .persona-name {
    font-size: 1.1rem;
    font-weight: bold;
    color: #005eb8;
    margin: 0.2rem 0 0.1rem 0;
    text-transform: uppercase;
    line-height: 1.0;
    flex-shrink: 0;
  }
  
  .job-title {
    color: #666;
    font-weight: bold;
    margin-bottom: 0.4rem;
    font-size: 0.75rem;
    line-height: 1.0;
    flex-shrink: 0;
  }
  
  .personal-data {
    flex: 1 1 0;
    overflow-y: auto;
    padding-right: 0.2rem;
    display: flex;
    flex-direction: column;
    gap: 0.4rem;
    min-height: 4rem;
  }

  .personal-data > div {
    background: transparent;
    border-radius: 0;
    padding: 0;
    border-left: none;
    box-shadow: none;
  }

  .personal-data h4 {
    color: #005eb8;
    font-size: 0.75rem;
    margin: 0;
    text-transform: uppercase;
    text-align: left;
    letter-spacing: 0.5px;
  }

  .persona-facts {
    display: flex;
    flex-direction: column;
    gap: 0.25rem;
  }

  .data-item {
    display: flex;
    align-items: flex-start;
    gap: 0.35rem;
    text-align: left;
    font-size: 0.68rem;
    line-height: 1.2;
    color: #1f1f1f;
  }

  .data-icon {
    font-size: 0.8rem;
    line-height: 1;
    flex-shrink: 0;
    margin-top: 0.1rem;
  }

  .data-item span:last-child {
    flex: 1;
  }

  .personal-data ul {
    text-align: left;
    font-size: 0.7rem;
    line-height: 1.2;
    margin: 0;
    padding-left: 0.9rem;
  }

  .personal-data li {
    margin-bottom: 0.2rem;
    color: #333;
  }
  
  .content-columns {
    display: flex;
    flex: 1;
    gap: 1.2rem;
    min-height: 0;
  }
  
  .content-single-column {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 0.6rem;
    min-height: 0;
  }
  
  .content-column {
    flex: 1;
    display: flex;
    flex-direction: column;
    min-height: 0;
  }
  
  .content-box {
    background: rgba(0, 94, 184, 0.05);
    border-radius: 6px;
    padding: 0.7rem;
    margin-bottom: 0.6rem;
    border-left: 3px solid #005eb8;
    flex-shrink: 0;
  }
  
  .section-title {
    font-size: 0.9rem;
    font-weight: bold;
    color: #005eb8;
    margin: 0 0 0.4rem 0;
    text-transform: uppercase;
    line-height: 1.1;
  }
  
  .content-box ul {
    margin: 0;
    padding-left: 0.8rem;
  }
  
  .content-box li {
    margin-bottom: 0.2rem;
    line-height: 1.1;
    color: #333;
    font-size: 0.75rem;
  }
  
  .skills-box {
    background: rgba(0, 94, 184, 0.05);
    border-radius: 8px;
    padding: 1rem;
    border-left: 3px solid #005eb8;
    flex: 1;
    min-height: 0;
  }
  
  .skill-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 0.4rem 0;
    font-size: 0.8rem;
  }
  
  .stars {
    color: #005eb8;
    font-size: 0.9rem;
  }
  
  .systems-grid {
    display: flex;
    justify-content: space-between;
    margin-top: 0.6rem;
    gap: 0.3rem;
  }
  
  .system-badge {
    background: #005eb8;
    color: white;
    padding: 0.3rem 0.5rem;
    border-radius: 4px;
    font-weight: bold;
    font-size: 0.7rem;
    text-align: center;
    flex: 1;
  }
  
  .logo-container {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    flex-shrink: 0;
    height: auto;
  }

  .logo-container img {
    height: 34px;
    padding: 0 0.5rem;
    object-fit: contain;
    flex-shrink: 0;
  }

---
# IT SUPPORT ANALYST

<div class="persona-content">

<div class="profile-column">
  <div class="profile-section">
  <img src="../images/placeholder.jpg" alt="Profile Photo" />
    <h2 class="persona-name">Ahmed Yusuf</h2>
    <p class="job-title">IT Support Analyst - Band 5, Digital Services</p>
    <div class="personal-data">
      <div>
        <h4>Professional Data</h4>
        <div class="persona-facts">
          <div class="data-item"><span class="data-icon">👤</span><span>31 years old, supports clinical systems, delivers user training, keen to improve digital adoption.</span></div>
          <div class="data-item"><span class="data-icon">📍</span><span>NHS Trust, Digital Services</span></div>
          <div class="data-item"><span class="data-icon">💼</span><span>Digital Services</span></div>
        </div>
      </div>
      <div>
        <h4>Role & Background</h4>
        <ul>
          <li>Supports clinical systems including Deterioration Radar</li>
          <li>Provides first-line support and troubleshooting</li>
          <li>Delivers user training</li>
          <li>Keen to improve digital adoption and reduce downtime</li>
          <li>Supports family locally</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="logo-container">
    <img src="../images/nhs-logo.jpg" alt="NHS logo" />
    <br />
    <img src="../images/microsoft-logo.png" alt="Microsoft logo" />
  </div>
</div>

<div class="content-single-column">
  
  <div class="content-box">
    <h3 class="section-title">Goals & Desired Outcomes</h3>
    <ul>
          <li>Ensure system uptime and rapid issue resolution</li>
          <li>Wants clear documentation and user feedback</li>
          <li>Minimal disruption to clinical workflows</li>
    </ul>
  </div>
  
  <div class="content-box">
    <h3 class="section-title">Wants & Needs</h3>
    <ul>
          <li>Access to system logs and user queries</li>
          <li>Ticketing systems and knowledge bases</li>
          <li>Desktop and remote access tools</li>
          <li>Regular training on new features</li>
    </ul>
  </div>

  <div class="content-box">
    <h3 class="section-title">Pain Points & Frustrations</h3>
    <ul>
          <li>Vague user queries and lack of feedback</li>
          <li>Needs better integration with clinical teams</li>
          <li>Wishes for automated alerts for system issues</li>
    </ul>
  </div>

</div>

</div>



---

# HEALTHCARE ASSISTANT

<div class="persona-content">

<div class="profile-column">
  <div class="profile-section">
  <img src="../images/placeholder.jpg" alt="Profile Photo" />
    <h2 class="persona-name">Aisha Begum</h2>
    <p class="job-title">Healthcare Assistant - Band 2, Acute Medicine</p>
    <div class="personal-data">
      <div>
        <h4>Professional Data</h4>
        <div class="persona-facts">
          <div class="data-item"><span class="data-icon">👤</span><span>4 years as an HCA in acute and emergency NHS settings, known for calm manner and rapport with anxious patients.</span></div>
          <div class="data-item"><span class="data-icon">📍</span><span>NHS Trust, Emergency Department Overflow</span></div>
          <div class="data-item"><span class="data-icon">💼</span><span>Emergency Department (ED) Overflow</span></div>
        </div>
      </div>
      <div>
        <h4>Role & Background</h4>
        <ul>
          <li>Worked 4 years as an HCA in NHS acute/emergency settings</li>
          <li>Known for building rapport with anxious patients</li>
          <li>Frequently covers overflow and temporary wards</li>
          <li>Juggles multiple patients and urgent tasks daily</li>
          <li>Fluent in English and Bengali</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="logo-container">
    <img src="../images/nhs-logo.jpg" alt="NHS logo" />
    <br />
    <img src="../images/microsoft-logo.png" alt="Microsoft logo" />
  </div>
</div>

<div class="content-single-column">
  
  <div class="content-box">
    <h3 class="section-title">Goals & Desired Outcomes</h3>
    <ul>
          <li>Ensure all patients have up-to-date vital signs recorded</li>
          <li>Spot early signs of deterioration and escalate promptly</li>
          <li>Track completion of observation rounds</li>
          <li>Prioritise which patients need obs next with system help</li>
    </ul>
  </div>
  
  <div class="content-box">
    <h3 class="section-title">Wants & Needs</h3>
    <ul>
          <li>Quick, mobile-friendly way to enter vitals</li>
          <li>Clear prompts for overdue/missing observations</li>
          <li>Minimal typing and clear patient lists</li>
          <li>Basic training and visual guides</li>
          <li>Face-to-face or walkie-talkie communication</li>
    </ul>
  </div>

  <div class="content-box">
    <h3 class="section-title">Pain Points & Frustrations</h3>
    <ul>
          <li>Paper obs charts get lost or delayed</li>
          <li>Hard to keep track of patients in non-standard areas</li>
          <li>Wishes for reminders and a single patient list</li>
          <li>Manual data entry is time-consuming</li>
    </ul>
  </div>

</div>

</div>



---

# RAPID RESPONSE TEAM LEAD

<div class="persona-content">

<div class="profile-column">
  <div class="profile-section">
  <img src="../images/placeholder.jpg" alt="Profile Photo" />
    <h2 class="persona-name">David Chen</h2>
    <p class="job-title">Advanced Clinical Practitioner - Band 8a, Rapid Response</p>
    <div class="personal-data">
      <div>
        <h4>Professional Data</h4>
        <div class="persona-facts">
          <div class="data-item"><span class="data-icon">👤</span><span>Experienced ACP, leads rapid response team, passionate about QI and digital innovation.</span></div>
          <div class="data-item"><span class="data-icon">📍</span><span>NHS Trust, Rapid Response Team</span></div>
          <div class="data-item"><span class="data-icon">💼</span><span>Rapid Response Team</span></div>
        </div>
      </div>
      <div>
        <h4>Role & Background</h4>
        <ul>
          <li>Experienced ACP, leads rapid response team</li>
          <li>Reviews escalated patients and supports junior staff</li>
          <li>Ensures compliance with escalation protocols</li>
          <li>Passionate about quality improvement and digital innovation</li>
          <li>Active in staff network</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="logo-container">
    <img src="../images/nhs-logo.jpg" alt="NHS logo" />
    <br />
    <img src="../images/microsoft-logo.png" alt="Microsoft logo" />
  </div>
</div>

<div class="content-single-column">
  
  <div class="content-box">
    <h3 class="section-title">Goals & Desired Outcomes</h3>
    <ul>
          <li>Ensure rapid review of deteriorating patients</li>
          <li>Track escalation trends and outcomes</li>
          <li>Automated reports and trend analysis</li>
          <li>Reduce adverse events and ensure timely interventions</li>
    </ul>
  </div>
  
  <div class="content-box">
    <h3 class="section-title">Wants & Needs</h3>
    <ul>
          <li>Access to escalation logs and patient trends</li>
          <li>Real-time data and printable summaries</li>
          <li>Desktop and tablet access</li>
          <li>Advanced analytics and export options</li>
          <li>Teams, phone, and email communication</li>
    </ul>
  </div>

  <div class="content-box">
    <h3 class="section-title">Pain Points & Frustrations</h3>
    <ul>
          <li>Manual data collation is frustrating</li>
          <li>Needs better integration with audit systems</li>
          <li>Wishes for automated alerts and PDF summaries</li>
    </ul>
  </div>

</div>

</div>



---

# CLINICAL GOVERNANCE LEAD

<div class="persona-content">

<div class="profile-column">
  <div class="profile-section">
  <img src="../images/placeholder.jpg" alt="Profile Photo" />
    <h2 class="persona-name">Dr. Emily Green</h2>
    <p class="job-title">Consultant Physician - Acute Medicine, Clinical Governance Lead</p>
    <div class="personal-data">
      <div>
        <h4>Professional Data</h4>
        <div class="persona-facts">
          <div class="data-item"><span class="data-icon">👤</span><span>47 years old, consultant responsible for clinical governance and patient safety, leads QI initiatives.</span></div>
          <div class="data-item"><span class="data-icon">📍</span><span>NHS Trust, Clinical Governance</span></div>
          <div class="data-item"><span class="data-icon">💼</span><span>Clinical Governance</span></div>
        </div>
      </div>
      <div>
        <h4>Role & Background</h4>
        <ul>
          <li>Consultant responsible for clinical governance and patient safety</li>
          <li>Reviews incident reports and audits escalation processes</li>
          <li>Leads quality improvement initiatives</li>
          <li>Champion for digital innovation, cautious about data security</li>
          <li>Lives with partner</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="logo-container">
    <img src="../images/nhs-logo.jpg" alt="NHS logo" />
    <br />
    <img src="../images/microsoft-logo.png" alt="Microsoft logo" />
  </div>
</div>

<div class="content-single-column">
  
  <div class="content-box">
    <h3 class="section-title">Goals & Desired Outcomes</h3>
    <ul>
          <li>Ensure compliance with escalation and documentation standards</li>
          <li>Track trends in patient deterioration and response times</li>
          <li>Robust audit trails and exportable reports</li>
          <li>Improve patient safety metrics and regulatory compliance</li>
    </ul>
  </div>
  
  <div class="content-box">
    <h3 class="section-title">Wants & Needs</h3>
    <ul>
          <li>Access to comprehensive, accurate data</li>
          <li>Dashboards and exportable audit logs</li>
          <li>Desktop access and secure data handling</li>
          <li>Training for new reporting tools</li>
    </ul>
  </div>

  <div class="content-box">
    <h3 class="section-title">Pain Points & Frustrations</h3>
    <ul>
          <li>Incomplete or inconsistent data</li>
          <li>Needs better integration with trust audit systems</li>
          <li>Wishes for automated compliance reports</li>
    </ul>
  </div>

</div>

</div>



---

# ON-CALL DOCTOR

<div class="persona-content">

<div class="profile-column">
  <div class="profile-section">
  <img src="../images/placeholder.jpg" alt="Profile Photo" />
    <h2 class="persona-name">Dr. Priya Patel</h2>
    <p class="job-title">Foundation Year 2 Doctor - Acute Medicine</p>
    <div class="personal-data">
      <div>
        <h4>Professional Data</h4>
        <div class="persona-facts">
          <div class="data-item"><span class="data-icon">👤</span><span>2 years post-qualification, rotating through acute medicine, confident with digital tools.</span></div>
          <div class="data-item"><span class="data-icon">📍</span><span>NHS Trust, Acute Medical Team</span></div>
          <div class="data-item"><span class="data-icon">💼</span><span>Acute Medical Team</span></div>
        </div>
      </div>
      <div>
        <h4>Role & Background</h4>
        <ul>
          <li>2 years post-qualification, acute medicine rotation</li>
          <li>Covers multiple wards and overflow areas</li>
          <li>Responds to escalations for deteriorating patients</li>
          <li>Confident with digital tools</li>
          <li>Commutes from nearby city</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="logo-container">
    <img src="../images/nhs-logo.jpg" alt="NHS logo" />
    <br />
    <img src="../images/microsoft-logo.png" alt="Microsoft logo" />
  </div>
</div>

<div class="content-single-column">
  
  <div class="content-box">
    <h3 class="section-title">Goals & Desired Outcomes</h3>
    <ul>
          <li>Respond quickly to escalation calls</li>
          <li>Prioritise patients by clinical risk and urgency</li>
          <li>Wants summary of recent obs and escalation history</li>
          <li>Timely reviews and safe discharges</li>
    </ul>
  </div>
  
  <div class="content-box">
    <h3 class="section-title">Wants & Needs</h3>
    <ul>
          <li>Concise, up-to-date patient summaries</li>
          <li>Clear escalation logs and SBAR handovers</li>
          <li>Mobile and desktop access</li>
          <li>Minimal duplication of data entry</li>
          <li>Bleep, phone, and secure messaging communication</li>
    </ul>
  </div>

  <div class="content-box">
    <h3 class="section-title">Pain Points & Frustrations</h3>
    <ul>
          <li>Missing or outdated obs</li>
          <li>Hard to get full picture of patients in overflow areas</li>
          <li>Needs better audit trails for rapid response</li>
          <li>Wishes for automated trend charts and alerts</li>
    </ul>
  </div>

</div>

</div>



---

# FAMILY CARER

<div class="persona-content">

<div class="profile-column">
  <div class="profile-section">
  <img src="../images/placeholder.jpg" alt="Profile Photo" />
    <h2 class="persona-name">John Smith</h2>
    <p class="job-title">Family Carer - Son</p>
    <div class="personal-data">
      <div>
        <h4>Professional Data</h4>
        <div class="persona-facts">
          <div class="data-item"><span class="data-icon">👤</span><span>54 years old, main carer and next of kin for elderly mother, balances work and caring duties.</span></div>
          <div class="data-item"><span class="data-icon">📍</span><span>NHS Trust, Community</span></div>
          <div class="data-item"><span class="data-icon">💼</span><span>N/A</span></div>
        </div>
      </div>
      <div>
        <h4>Role & Background</h4>
        <ul>
          <li>Main carer and next of kin for elderly mother</li>
          <li>Works part-time, visits daily</li>
          <li>Proactive in asking questions about care</li>
          <li>Sometimes struggles to get updates from busy staff</li>
          <li>Local resident</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="logo-container">
    <img src="../images/nhs-logo.jpg" alt="NHS logo" />
    <br />
    <img src="../images/microsoft-logo.png" alt="Microsoft logo" />
  </div>
</div>

<div class="content-single-column">
  
  <div class="content-box">
    <h3 class="section-title">Goals & Desired Outcomes</h3>
    <ul>
          <li>Wants timely updates on mother’s condition</li>
          <li>Hopes to be involved in care decisions</li>
          <li>Feels confident in care provided</li>
    </ul>
  </div>
  
  <div class="content-box">
    <h3 class="section-title">Wants & Needs</h3>
    <ul>
          <li>Clear, regular communication from staff</li>
          <li>Phone calls and in-person updates</li>
          <li>Prefers written summaries for reference</li>
          <li>Needs information about escalation and contacts</li>
    </ul>
  </div>

  <div class="content-box">
    <h3 class="section-title">Pain Points & Frustrations</h3>
    <ul>
          <li>Inconsistent updates from staff</li>
          <li>Hard to get through on the phone</li>
          <li>Wishes for a single point of contact</li>
    </ul>
  </div>

</div>

</div>



---

# PATIENT

<div class="persona-content">

<div class="profile-column">
  <div class="profile-section">
  <img src="../images/placeholder.jpg" alt="Profile Photo" />
    <h2 class="persona-name">Mary Jones</h2>
    <p class="job-title">Patient - Elderly, Frailty</p>
    <div class="personal-data">
      <div>
        <h4>Professional Data</h4>
        <div class="persona-facts">
          <div class="data-item"><span class="data-icon">👤</span><span>81 years old, admitted with chest infection, mild cognitive impairment, limited mobility.</span></div>
          <div class="data-item"><span class="data-icon">📍</span><span>NHS Trust, Temporary Ward</span></div>
          <div class="data-item"><span class="data-icon">💼</span><span>Temporary Ward</span></div>
        </div>
      </div>
      <div>
        <h4>Role & Background</h4>
        <ul>
          <li>Lives alone, admitted with chest infection</li>
          <li>Mild cognitive impairment and limited mobility</li>
          <li>Anxious in busy, unfamiliar environment</li>
          <li>Struggles to remember when last observations were taken</li>
          <li>On pension, limited income</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="logo-container">
    <img src="../images/nhs-logo.jpg" alt="NHS logo" />
    <br />
    <img src="../images/microsoft-logo.png" alt="Microsoft logo" />
  </div>
</div>

<div class="content-single-column">
  
  <div class="content-box">
    <h3 class="section-title">Goals & Desired Outcomes</h3>
    <ul>
          <li>Wants to feel safe and reassured</li>
          <li>Hopes staff will notice if she feels worse</li>
          <li>Reviewed promptly and kept informed</li>
    </ul>
  </div>
  
  <div class="content-box">
    <h3 class="section-title">Wants & Needs</h3>
    <ul>
          <li>Clear communication and reassurance</li>
          <li>Staff to explain what’s happening</li>
          <li>Prefers face-to-face updates</li>
          <li>Accessible information (large print, simple language)</li>
    </ul>
  </div>

  <div class="content-box">
    <h3 class="section-title">Pain Points & Frustrations</h3>
    <ul>
          <li>Long waits and lack of updates</li>
          <li>Anxious when staff seem rushed or forgetful</li>
          <li>Wishes for a call bell that works in corridors</li>
    </ul>
  </div>

</div>

</div>



---

# NURSE-IN-CHARGE

<div class="persona-content">

<div class="profile-column">
  <div class="profile-section">
  <img src="../images/placeholder.jpg" alt="Profile Photo" />
    <h2 class="persona-name">Sarah O’Connor</h2>
    <p class="job-title">Senior Sister - Band 7, Site Management</p>
    <div class="personal-data">
      <div>
        <h4>Professional Data</h4>
        <div class="persona-facts">
          <div class="data-item"><span class="data-icon">👤</span><span>18 years in acute care, leads site team for patient flow and escalation.</span></div>
          <div class="data-item"><span class="data-icon">📍</span><span>NHS Trust, Site Management Team</span></div>
          <div class="data-item"><span class="data-icon">💼</span><span>Site Management Team</span></div>
        </div>
      </div>
      <div>
        <h4>Role & Background</h4>
        <ul>
          <li>18 years’ experience in acute care</li>
          <li>Leads site team for patient flow and escalation</li>
          <li>Coordinates staff across multiple areas</li>
          <li>Accountable for safe staffing and escalation</li>
          <li>Part-time MSc student</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="logo-container">
    <img src="../images/nhs-logo.jpg" alt="NHS logo" />
    <br />
    <img src="../images/microsoft-logo.png" alt="Microsoft logo" />
  </div>
</div>

<div class="content-single-column">
  
  <div class="content-box">
    <h3 class="section-title">Goals & Desired Outcomes</h3>
    <ul>
          <li>Maintain oversight of all at-risk patients across site</li>
          <li>Ensure timely escalation and documentation</li>
          <li>Dashboard view of all escalations and actions</li>
          <li>Safe patient flow and compliance with protocols</li>
    </ul>
  </div>
  
  <div class="content-box">
    <h3 class="section-title">Wants & Needs</h3>
    <ul>
          <li>Real-time, site-wide patient status</li>
          <li>Clear audit trails and escalation logs</li>
          <li>Desktop dashboard and printable summaries</li>
          <li>Training for new digital tools</li>
          <li>Phone, Teams, and in-person communication</li>
    </ul>
  </div>

  <div class="content-box">
    <h3 class="section-title">Pain Points & Frustrations</h3>
    <ul>
          <li>Fragmented escalation records</li>
          <li>Needs better visibility of patients in non-standard areas</li>
          <li>Manual reporting is time-consuming</li>
          <li>Wishes for automated summaries and alerts</li>
    </ul>
  </div>

</div>

</div>



---

# TRIAGE NURSE

<div class="persona-content">

<div class="profile-column">
  <div class="profile-section">
  <img src="../images/placeholder.jpg" alt="Profile Photo" />
    <h2 class="persona-name">Tom Williams</h2>
    <p class="job-title">Registered Nurse - Band 6, Triage</p>
    <div class="personal-data">
      <div>
        <h4>Professional Data</h4>
        <div class="persona-facts">
          <div class="data-item"><span class="data-icon">👤</span><span>10 years in emergency nursing, 3 years as triage nurse in NHS ED.</span></div>
          <div class="data-item"><span class="data-icon">📍</span><span>NHS Trust, Emergency Department</span></div>
          <div class="data-item"><span class="data-icon">💼</span><span>Emergency Department (ED)</span></div>
        </div>
      </div>
      <div>
        <h4>Role & Background</h4>
        <ul>
          <li>10 years’ experience in emergency nursing</li>
          <li>3 years as triage nurse in NHS ED</li>
          <li>Responsible for initial assessment and risk stratification</li>
          <li>Manages patients in corridors and overflow spaces</li>
          <li>Lives locally</li>
        </ul>
      </div>
    </div>
  </div>

  <div class="logo-container">
    <img src="../images/nhs-logo.jpg" alt="NHS logo" />
    <br />
    <img src="../images/microsoft-logo.png" alt="Microsoft logo" />
  </div>
</div>

<div class="content-single-column">
  
  <div class="content-box">
    <h3 class="section-title">Goals & Desired Outcomes</h3>
    <ul>
          <li>Rapidly identify high-risk patients and escalate as needed</li>
          <li>Maintain oversight of all patients in non-standard areas</li>
          <li>Track time since last obs and ensure timely reviews</li>
          <li>System flags deteriorating patients automatically</li>
    </ul>
  </div>
  
  <div class="content-box">
    <h3 class="section-title">Wants & Needs</h3>
    <ul>
          <li>Real-time updates and clear risk scores</li>
          <li>Accurate, up-to-date patient lists</li>
          <li>Desktop and tablet access</li>
          <li>Integration with SBAR handover tools</li>
          <li>Phone, bleep, and in-person communication</li>
    </ul>
  </div>

  <div class="content-box">
    <h3 class="section-title">Pain Points & Frustrations</h3>
    <ul>
          <li>Fragmented information and handovers</li>
          <li>Hard to monitor patients outside main bays</li>
          <li>Needs better visibility of overdue obs and escalation status</li>
          <li>Manual tracking is error-prone</li>
    </ul>
  </div>

</div>

</div>
