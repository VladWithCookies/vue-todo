import axios from 'axios';

const httpClient = axios.create({
  baseURL: 'http://localhost:3000',
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  },
});

export const getProjects = () => httpClient.get('/projects');
export const createProject = () => httpClient.post('/projects');

export const deleteProject = (projectId) =>
  httpClient.delete(`/projects/${projectId}`);

export const updateProject = (projectId, title) =>
  httpClient.patch(`/projects/${projectId}`, { title });
