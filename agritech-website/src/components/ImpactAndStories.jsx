import React from 'react';
import { Box, Typography, Container, Grid, Card, CardContent, CardHeader, Avatar } from '@mui/material';

// Sample data for testimonials
const testimonials = [
  {
    name: 'Jafar Malik',
    role: 'Farmer',
    avatar: 'JM',
    testimonial: 'Using AgriTech has significantly improved my crop yields and reduced losses due to pests and diseases. Highly recommend it to fellow farmers!'
  },
  {
    name: 'Asif Khan',
    role: 'Agricultural Scientist',
    avatar: 'AK',
    testimonial: 'The precision and accuracy of AgriTech’s disease detection have made a noticeable difference in local farming communities.'
  },
  {
    name: 'Wahab Ahmad',
    role: 'Agricultural Scientist',
    avatar: 'Wa',
    testimonial: 'Using AgriTech has significantly improved my crop yields and reduced losses due to pests and diseases. Highly recommend it to fellow farmers!'
  },
  {
    name: 'Faisal rehman',
    role: 'Farmer',
    avatar: 'Fr',
    testimonial: 'The precision and accuracy of AgriTech’s disease detection have made a noticeable difference in local farming communities.'
  }
];

const ImpactAndStories = () => {
  return (
    <Container maxWidth="lg">
      <Box py={6}>
        <Typography variant="h3" gutterBottom align="center">
          Impact & Stories
        </Typography>

        {/* Success Stories Section */}
        <Typography variant="h4" gutterBottom>
          Success Stories
        </Typography>
        <Grid container spacing={3}>
          {testimonials.map((testimonial, index) => (
            <Grid item xs={12} sm={6} key={index}>
              <Card>
                <CardHeader
                  avatar={<Avatar>{testimonial.avatar}</Avatar>}
                  title={testimonial.name}
                  subheader={testimonial.role}
                />
                <CardContent>
                  <Typography variant="body2" color="text.secondary">
                    {testimonial.testimonial}
                  </Typography>
                </CardContent>
              </Card>
            </Grid>
          ))}
        </Grid>
{/* 
       
        <Box mt={4}>
          <Typography variant="h4" gutterBottom>
            Data & Insights
          </Typography>
          <Typography paragraph>
            Our project has made significant strides in improving agricultural practices:
          </Typography>
          <Box display="flex" justifyContent="center" alignItems="center">
            <BarChartIcon sx={{ fontSize: 100 }} /> 
            <Typography paragraph sx={{ ml: 2 }}>
              Note: Insert graphical data or statistics here to illustrate the impact on crop yield, reduction in pesticide use, etc.
            </Typography>
          </Box>
        </Box> */}
      </Box>
    </Container>
  );
};

export default ImpactAndStories;
