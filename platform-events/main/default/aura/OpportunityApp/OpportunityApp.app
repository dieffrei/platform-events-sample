<aura:application extends="force:slds" implements="flexipage:availableForAllPageTypes,flexipage:availableForRecordHome,force:hasRecordId">
    <lightning:path aura:id="path" recordId="{!v.recordId}"
        variant=""
        hideUpdateButton=""
        onselect="{!c.handleSelect}"
    />
</aura:application>