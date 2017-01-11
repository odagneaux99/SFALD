trigger closeOpportunityTrigger on Opportunity (before insert) {

    List<Opportunity> oppClosedWon = [SELECT Id, StageName FROM Opportunity
        WHERE Id IN :Trigger.New AND StageName = 'Closed Won'];
        
    // Ajout commentaire
    List<Task> tasksToCreate = new List<Task>();
    
    // Commentaire dev1
    for (Opportunity a : oppClosedWon) {
        Task newTask = new Task();
        newTask.Subject = 'Follow Up Test Task';
        newTask.WhatId = a.Id;
        
        tasksToCreate.add(newTask);
    }
    
    // Commentaire dev2
    // Commentaire dev3
    // Commentaire dev4
    insert(tasksToCreate);
    
}