#!/usr/bin/env python3
"""
Script to create "Coming Soon" placeholder pages for CX CoE guide
Usage: python3 create_coming_soon_pages.py
"""

import os
from pathlib import Path

# Base directory
CONTENT_DIR = Path("content/cx-center-of-excellence")

# Ensure directory exists
CONTENT_DIR.mkdir(parents=True, exist_ok=True)

def slug_to_title(slug):
    """Convert slug to title case"""
    return slug.replace('-', ' ').title()

def create_coming_soon_page(slug, description, related_links):
    """Create a Coming Soon page"""
    filepath = CONTENT_DIR / f"{slug}.md"
   
    # Skip if file already has content
    if filepath.exists() and filepath.stat().st_size > 100:
        print(f"  ⏭️  Skipping {slug}.md (already has content)")
        return
   
    title = slug_to_title(slug)
   
    content = f"""---
title: {title}
layout: layouts/page
tags: cx-center-of-excellence
description: {description}
permalink: /cx-center-of-excellence/{slug}/
sidenav: cx-center-of-excellence
sticky_sidenav: true
---

# {title}

<div class="usa-alert usa-alert--info">
  <div class="usa-alert__body">
    <h4 class="usa-alert__heading">Content Coming Soon</h4>
    <p class="usa-alert__text">
      This page is currently under development. Check back soon for detailed guidance on this topic.
    </p>
  </div>
</div>

## What to expect

This page will provide guidance on {description.lower()}.

## In the meantime

Related resources you can explore now:

{related_links}

---

### Need Help?

For advice or consultation on your CX research plan, please contact the **Customer Experience Center of Excellence (CX CoE)**.

For questions about the Paperwork Reduction Act, please contact the **[Office of Strategic Operations and Regulatory Affairs (OSORA)](/cx-center-of-excellence/organizations/)**.
"""
   
    filepath.write_text(content)
    print(f"  ✓ Created {slug}.md")

def main():
    print("Creating Coming Soon pages for CX Center of Excellence...\n")
   
    # Priority 1: Planning
    print("Creating Priority 1 pages (Planning)...")
   
    create_coming_soon_page(
        "research-planning-assessment",
        "Assess your research needs and requirements",
        """- [Before Getting Started](/cx-center-of-excellence/before-getting-started/)
- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)
- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/)"""
    )
   
    create_coming_soon_page(
        "compliance",
        "Ensure your research meets all CMS and federal requirements",
        """- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)
- [When PRA Applies](/cx-center-of-excellence/when-pra-applies/)
- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/)"""
    )
   
    # Priority 2: PRA Guidance
    print("\nCreating Priority 2 pages (PRA Guidance)...")
   
    pra_pages = [
        ("cx-and-paperwork-reduction-act", "Understanding PRA requirements for customer experience research"),
        ("when-pra-applies", "Determine when your research requires PRA clearance"),
        ("clearance-types", "Understanding different types of PRA clearances"),
        ("generic-fast-track-approval-process", "Using existing generic clearances for fast approval"),
        ("normal-clearance-approval-process", "The standard PRA clearance approval process"),
    ]
   
    for slug, desc in pra_pages:
        create_coming_soon_page(
            slug, desc,
            """- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/)
- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)"""
        )
   
    # Research Methods
    print("\nCreating Research Methods pages...")
   
    create_coming_soon_page(
        "methods",
        "Overview of customer experience research methods",
        """- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)
- [Discovery Methods](/cx-center-of-excellence/discovery/)
- [Conducting Research](/cx-center-of-excellence/how-to-conduct-with-pra-in-mind/)"""
    )
   
    create_coming_soon_page(
        "discovery",
        "Research methods for discovering user needs and insights",
        """- [Methods Overview](/cx-center-of-excellence/methods/)
- [User Interviews](/cx-center-of-excellence/user-interviews/)
- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)"""
    )
   
    # Individual methods
    methods = [
        ("usability-testing", "Usability testing methods and best practices"),
        ("user-interviews", "Conducting effective user interviews"),
        ("card-sorting", "Card sorting for information architecture"),
        ("affinity-mapping", "Organizing research insights with affinity mapping"),
        ("contextual-inquiry", "Observing users in their natural environment"),
        ("cognitive-walkthrough", "Evaluating user interfaces through cognitive walkthrough"),
        ("comparative-analysis", "Comparing and analyzing different solutions"),
        ("content-audit", "Auditing existing content"),
        ("design-studio", "Collaborative design ideation sessions"),
        ("desirability-testing", "Testing visual and emotional appeal"),
        ("diary-study", "Longitudinal research through participant diaries"),
        ("dot-voting", "Group prioritization and decision-making"),
        ("five-whys", "Root cause analysis technique"),
        ("heuristic-evaluation", "Expert evaluation against usability principles"),
        ("interface-audit", "Evaluating user interface elements"),
        ("journey-mapping", "Mapping the customer journey"),
        ("kj-method", "Organizing and synthesizing qualitative data"),
        ("mental-modeling", "Understanding user mental models"),
        ("multivariate-testing", "Testing multiple variables simultaneously"),
        ("personas", "Creating user personas"),
        ("site-mapping", "Mapping website structure and navigation"),
        ("stakeholder-influence-mapping", "Mapping stakeholder relationships and influence"),
        ("stakeholder-interviews", "Conducting stakeholder interviews"),
        ("storyboarding", "Visualizing user scenarios and experiences"),
        ("style-tiles", "Exploring visual design direction"),
        ("task-flow-analysis", "Analyzing user task flows"),
        ("user-scenarios", "Creating realistic user scenarios"),
        ("visual-preference-testing", "Testing visual design preferences"),
    ]
   
    for slug, desc in methods:
        create_coming_soon_page(
            slug, desc,
            """- [Research Methods Overview](/cx-center-of-excellence/methods/)
- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)"""
        )
   
    # Conducting Research
    print("\nCreating Conducting Research pages...")
   
    conducting_pages = [
        ("how-to-conduct-with-pra-in-mind", "Conducting research while maintaining PRA compliance"),
        ("consent-forms", "Creating and using participant consent forms"),
        ("interview-guides", "Creating effective interview guides"),
        ("participant-recruitment", "Recruiting research participants"),
        ("participant-compensation", "Compensating research participants"),
    ]
   
    for slug, desc in conducting_pages:
        create_coming_soon_page(
            slug, desc,
            """- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)
- [Methods](/cx-center-of-excellence/methods/)"""
        )
   
    # Special Topics
    print("\nCreating Special Topics pages...")
   
    special_topics = [
        ("cx-and-equitable-research", "Conducting equitable and inclusive research"),
        ("cx-and-excluded-populations", "Researching with people with disabilities and excluded populations"),
        ("trauma-informed-practices", "Applying trauma-informed approaches to research"),
        ("privacy-measures", "Protecting participant privacy in research"),
    ]
   
    for slug, desc in special_topics:
        create_coming_soon_page(
            slug, desc,
            """- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)
- [Compliance](/cx-center-of-excellence/compliance/)"""
        )
   
    # Tools & Resources
    print("\nCreating Tools & Resources pages...")
   
    resources_pages = [
        ("research-repository", "CMS customer experience research repository"),
        ("touchpoints", "Using Touchpoints for feedback collection"),
        ("communities", "CMS customer experience communities of practice"),
        ("organizations", "Key CMS organizations supporting customer experience research"),
        ("tools", "Tools for customer experience research at CMS"),
        ("resources", "Additional resources for CX research"),
        ("references", "References and citations"),
    ]
   
    for slug, desc in resources_pages:
        create_coming_soon_page(
            slug, desc,
            """- [Planning Your Research](/cx-center-of-excellence/planning-your-research/)
- [CMS CX and PRA Playbook](/cms-cx-pra-playbook/)"""
        )
   
    # Wrapping Up
    print("\nCreating Wrapping Up pages...")
   
    create_coming_soon_page(
        "sharing-and-archiving",
        "Sharing findings and archiving research",
        """- [Research Repository](/cx-center-of-excellence/research-repository/)
- [Methods](/cx-center-of-excellence/methods/)"""
    )
   
    print("\n✓ Done! Created Coming Soon pages.")
    print("\nNext steps:")
    print("  1. Review the created files in content/cx-center-of-excellence/")
    print("  2. Replace Coming Soon pages with real content as it becomes available")
    print("  3. Run 'npm run dev' to test locally")

if __name__ == "__main__":
    main()