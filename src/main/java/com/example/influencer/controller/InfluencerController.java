package com.example.influencer.controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import com.example.influencer.service.InfluencerService;
import org.springframework.beans.factory.annotation.Autowired;
@RestController
@RequestMapping("/api/influencers")
public class InfluencerController {
  @Autowired
  private InfluencerService svc;
  @GetMapping("/search")
  public ResponseEntity<?> search(@RequestParam String q){ return ResponseEntity.ok(svc.search(q)); }
  @GetMapping("/compare")
  public ResponseEntity<?> compare(@RequestParam String ids){ return ResponseEntity.ok(svc.compare(ids)); }
} 