#!/bin/bash

# Script to create "Coming Soon" placeholder pages for CX CoE guide
# Usage: ./create-coming-soon-pages.sh

# Color output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Creating Coming Soon pages for CX Center of Excellence...${NC}"

# Create content directory if it doesn't exist
mkdir -p content/cx-center-of-excellence

# Function to convert slug to title (capitalize words, replace hyphens with spaces)
slug_to_title() {
    echo "$1" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2));}1'
}

# Function to create a Coming Soon page
create_coming_soon() {
    local slug=$1
    local description=$2
    local related_links=$3
    local filepath="content/cx-center-of-excellence/${slug}.md"
    local title=$(slug_to_title "$slug")
   
    # Skip if file already exists
    if [ -f "$filepath" ]; then
        echo "  ⏭️  Skipping ${slug}.md (already exists)"
        return
    fi
   
    cat > "$filepath" << EOF
---
title: ${title}
layout: layouts/page
tags: cx-center-of-excellence
description: ${description}
permalink: /cx-center-of-excellence/${slug}/
sidenav: cx-center-of-excellence
sticky_sidenav: true
---

# ${title}

<div class="usa-alert usa-alert--info">
  <div class="usa-alert__body">
    <h4 class="usa-alert__heading">Content Coming Soon</h4>
    <p class="usa-alert__text">
      This page is currently under development. Check back soon for detailed guidance on this topic.
    </p>
  </div>
</div>

## What to expect

This page will provide guidance on ${description,,}.

## In the meantime

Related resources you can explore now:

${related_links}

---

### Need Help?

For advice or consultation on your CX research plan, please contact the **Customer Experience Center of Excellence (CX CoE)**.

For questions about the Paperwork Reduction Act, please contact the **[Office of Strategic Operations and Regulatory Affairs (OSORA)](/cx-center-of-excellence/organizations/)**.
EOF
   
    echo -e "  ${GREEN}✓${NC} Created ${slug}.md"
}

echo ""
echo "Creating Priority 1 pages (Planning)..."

create_coming_soon "research-planning-assessment" \
    "Assess your research needs and requirements" \
    "- [Before Getting Started](/cx-center-of-excellence/before-getting-started/)
- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)
- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/)"

create_coming_soon "compliance" \
    "Ensure your research meets all CMS and federal requirements" \
    "- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)
- [When PRA Applies](/cx-center-of-excellence/when-pra-applies/)
- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/)"

echo ""
echo "Creating Priority 2 pages (PRA Guidance)..."

create_coming_soon "cx-and-paperwork-reduction-act" \
    "Understanding PRA requirements for customer experience research" \
    "- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/)
- [When PRA Applies](/cx-center-of-excellence/when-pra-applies/)
- [Clearance Types](/cx-center-of-excellence/clearance-types/)"

create_coming_soon "when-pra-applies" \
    "Determine when your research requires PRA clearance" \
    "- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/when-do-i-need-a-pra-clearance-for-cx/)
- [Clearance Types](/cx-center-of-excellence/clearance-types/)
- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)"

create_coming_soon "clearance-types" \
    "Understanding different types of PRA clearances" \
    "- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/what-are-pra-clearances/)
- [Fast Track Process](/cx-center-of-excellence/generic-fast-track-approval-process/)
- [Normal Clearance Process](/cx-center-of-excellence/normal-clearance-approval-process/)"

create_coming_soon "generic-fast-track-approval-process" \
    "Using existing generic clearances for fast approval" \
    "- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/generic-fast-track-process/)
- [Clearance Types](/cx-center-of-excellence/clearance-types/)
- [Normal Clearance Process](/cx-center-of-excellence/normal-clearance-approval-process/)"

create_coming_soon "normal-clearance-approval-process" \
    "The standard PRA clearance approval process" \
    "- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/normal-clearance-process/)
- [Fast Track Process](/cx-center-of-excellence/generic-fast-track-approval-process/)
- [Clearance Types](/cx-center-of-excellence/clearance-types/)"

echo ""
echo "Creating Research Methods pages..."

create_coming_soon "methods" \
    "Overview of customer experience research methods" \
    "- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)
- [Discovery Methods](/cx-center-of-excellence/discovery/)
- [Conducting Research](/cx-center-of-excellence/how-to-conduct-with-pra-in-mind/)"

create_coming_soon "discovery" \
    "Research methods for discovering user needs and insights" \
    "- [Methods Overview](/cx-center-of-excellence/methods/)
- [User Interviews](/cx-center-of-excellence/user-interviews/)
- [Contextual Inquiry](/cx-center-of-excellence/contextual-inquiry/)"

# Individual methods
methods=(
    "usability-testing:Usability testing methods and best practices"
    "user-interviews:Conducting effective user interviews"
    "card-sorting:Card sorting for information architecture"
    "affinity-mapping:Organizing research insights with affinity mapping"
    "contextual-inquiry:Observing users in their natural environment"
    "cognitive-walkthrough:Evaluating user interfaces through cognitive walkthrough"
    "comparative-analysis:Comparing and analyzing different solutions"
    "content-audit:Auditing existing content"
    "design-studio:Collaborative design ideation sessions"
    "desirability-testing:Testing visual and emotional appeal"
    "diary-study:Longitudinal research through participant diaries"
    "dot-voting:Group prioritization and decision-making"
    "five-whys:Root cause analysis technique"
    "heuristic-evaluation:Expert evaluation against usability principles"
    "interface-audit:Evaluating user interface elements"
    "journey-mapping:Mapping the customer journey"
    "kj-method:Organizing and synthesizing qualitative data"
    "mental-modeling:Understanding user mental models"
    "multivariate-testing:Testing multiple variables simultaneously"
    "personas:Creating user personas"
    "site-mapping:Mapping website structure and navigation"
    "stakeholder-influence-mapping:Mapping stakeholder relationships and influence"
    "stakeholder-interviews:Conducting stakeholder interviews"
    "storyboarding:Visualizing user scenarios and experiences"
    "style-tiles:Exploring visual design direction"
    "task-flow-analysis:Analyzing user task flows"
    "user-scenarios:Creating realistic user scenarios"
    "visual-preference-testing:Testing visual design preferences"
)

for method in "${methods[@]}"; do
    IFS=':' read -r slug desc <<< "$method"
    create_coming_soon "$slug" "$desc" "- [Research Methods Overview](/cx-center-of-excellence/methods/)
- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)"
done

echo ""
echo "Creating Conducting Research pages..."

create_coming_soon "how-to-conduct-with-pra-in-mind" \
    "Conducting research while maintaining PRA compliance" \
    "- [CX and PRA](/cx-center-of-excellence/cx-and-paperwork-reduction-act/)
- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)
- [Consent Forms](/cx-center-of-excellence/consent-forms/)"

create_coming_soon "consent-forms" \
    "Creating and using participant consent forms" \
    "- [How to Conduct with PRA in Mind](/cx-center-of-excellence/how-to-conduct-with-pra-in-mind/)
- [Privacy Measures](/cx-center-of-excellence/privacy-measures/)"

create_coming_soon "interview-guides" \
    "Creating effective interview guides" \
    "- [User Interviews](/cx-center-of-excellence/user-interviews/)
- [Stakeholder Interviews](/cx-center-of-excellence/stakeholder-interviews/)"

create_coming_soon "participant-recruitment" \
    "Recruiting research participants" \
    "- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)
- [Participant Compensation](/cx-center-of-excellence/participant-compensation/)"

create_coming_soon "participant-compensation" \
    "Compensating research participants" \
    "- [Participant Recruitment](/cx-center-of-excellence/participant-recruitment/)
- [Compliance](/cx-center-of-excellence/compliance/)"

echo ""
echo "Creating Special Topics pages..."

create_coming_soon "cx-and-equitable-research" \
    "Conducting equitable and inclusive research" \
    "- [Excluded Populations](/cx-center-of-excellence/cx-and-excluded-populations/)
- [Trauma-Informed Practices](/cx-center-of-excellence/trauma-informed-practices/)
- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)"

create_coming_soon "cx-and-excluded-populations" \
    "Researching with people with disabilities and excluded populations" \
    "- [Equitable Research](/cx-center-of-excellence/cx-and-equitable-research/)
- [Trauma-Informed Practices](/cx-center-of-excellence/trauma-informed-practices/)"

create_coming_soon "trauma-informed-practices" \
    "Applying trauma-informed approaches to research" \
    "- [Equitable Research](/cx-center-of-excellence/cx-and-equitable-research/)
- [Excluded Populations](/cx-center-of-excellence/cx-and-excluded-populations/)"

create_coming_soon "privacy-measures" \
    "Protecting participant privacy in research" \
    "- [Consent Forms](/cx-center-of-excellence/consent-forms/)
- [Compliance](/cx-center-of-excellence/compliance/)"

echo ""
echo "Creating Tools & Resources pages..."

create_coming_soon "research-repository" \
    "CMS customer experience research repository" \
    "- [Before Getting Started](/cx-center-of-excellence/before-getting-started/)
- [Sharing and Archiving](/cx-center-of-excellence/sharing-and-archiving/)"

create_coming_soon "touchpoints" \
    "Using Touchpoints for feedback collection" \
    "- [Tools](/cx-center-of-excellence/tools/)
- [Methods](/cx-center-of-excellence/methods/)"

create_coming_soon "communities" \
    "CMS customer experience communities of practice" \
    "- [Organizations](/cx-center-of-excellence/organizations/)
- [Resources](/cx-center-of-excellence/resources/)"

create_coming_soon "organizations" \
    "Key CMS organizations supporting customer experience research" \
    "- [Communities](/cx-center-of-excellence/communities/)
- [Resources](/cx-center-of-excellence/resources/)"

create_coming_soon "tools" \
    "Tools for customer experience research at CMS" \
    "- [Touchpoints](/cx-center-of-excellence/touchpoints/)
- [Research Repository](/cx-center-of-excellence/research-repository/)"

create_coming_soon "resources" \
    "Additional resources for CX research" \
    "- [Organizations](/cx-center-of-excellence/organizations/)
- [Communities](/cx-center-of-excellence/communities/)
- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/)"

create_coming_soon "references" \
    "References and citations" \
    "- [Resources](/cx-center-of-excellence/resources/)
- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/references/)"

echo ""
echo "Creating Wrapping Up pages..."

create_coming_soon "sharing-and-archiving" \
    "Sharing findings and archiving research" \
    "- [Research Repository](/cx-center-of-excellence/research-repository/)
- [Methods](/cx-center-of-excellence/methods/)"

echo ""
echo -e "${GREEN}✓ Done!${NC} Created Coming Soon pages."
echo ""
echo "Next steps:"
echo "  1. Review the created files in content/cx-center-of-excellence/"
echo "  2. Replace Coming Soon pages with real content as it becomes available"
echo "  3. Run 'npm run dev' to test locally"
echo ""