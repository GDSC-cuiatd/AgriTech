import React from 'react';
import { Box, Typography, Container, Grid, Card, CardContent, CardMedia, Avatar } from '@mui/material';
import awais from '../assets/team/img-awais.jpg'
import hammad from '../assets/team/hammad.jpeg'
import raees from '../assets/team/raees.jpeg'
import munner from '../assets/team/munner.jpeg'
// Sample team member data
const teamMembers = [
  {
    name: 'M.Raees Azam',
    role: 'Head & AI/ML Specialist',
    imageUrl: raees, 
    contributions: 'Leading the AI and ML development efforts, designing algorithms for crop disease detection.'
  },
  {
    name: 'M. Awais Khan',
    role: 'Web & Project Maintenance',
    imageUrl: awais, // Replace with actual image path or URL
    contributions: 'Responsible for web development, Github repository management and ongoing project maintenance. '
  },
  {
    name: 'Muneer Hasan',
    role: 'Flutter Developer',
    imageUrl: munner, 
    contributions: 'Developing the mobile application using Flutter for cross-platform compatibility.'
  },
  {
    name: 'Hammad Ali Khan',
    role: 'UI/UX Designer',
    imageUrl: hammad, // Replace with actual image path or URL
    contributions: 'Designing user interfaces and user experiences for the mobile and web applications.'
  }
];

const Team = () => {
  return (
    <Container maxWidth="lg">
      <Box py={6}>
        <Typography variant="h3" gutterBottom align="center">
          AgriTech Team
        </Typography>
        <Grid container spacing={3}>
          {teamMembers.map((member, index) => (
            <Grid item xs={12} sm={6} md={3} key={index}>
              <Card>
                <CardMedia>
                  <Avatar
                    alt={member.name}
                    src={member.imageUrl}
                    sx={{ width: 128, height: 128, margin: 'auto' }}
                  />  
                </CardMedia>
                <CardContent>
                  <Typography gutterBottom variant="h5" component="div">
                    {member.name}
                  </Typography>
                  <Typography variant="body2" color="text.secondary">
                    {member.role}
                  </Typography>
                  <Typography variant="body2" color="text.primary">
                    {member.contributions}
                  </Typography>
                </CardContent>
              </Card>
            </Grid>
          ))}
        </Grid>
      </Box>
    </Container>
  );
};

export default Team;
