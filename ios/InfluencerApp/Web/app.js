fetch('http://localhost:8080/api/influencers/compare?ids=1,2')
  .then(r=>r.json())
  .then(data=>{
    const ctx=document.getElementById('engagementChart').getContext('2d');
    new Chart(ctx,{type:'bar',data:{labels:['A','B'],datasets:[{label:'Engagement',data:[10,20]}]}});
  }).catch(e=>console.error(e));