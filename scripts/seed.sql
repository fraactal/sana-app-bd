-- Insertar roles iniciales
INSERT INTO roles (name, description) VALUES
('Administrador', 'Acceso completo al sistema'),
('Recepcionista', 'Gestión de citas y pacientes'),
('Profesional', 'Acceso a historias clínicas y documentación médica')
ON CONFLICT DO NOTHING;

-- Insertar horarios iniciales
INSERT INTO schedules (day, start_time, end_time, consultation_type) VALUES
('Lunes', '09:00', '17:00', 'General'),
('Martes', '09:00', '17:00', 'General'),
('Miercoles', '09:00', '17:00', 'Specialist')
ON CONFLICT DO NOTHING;

-- Insertar integraciones iniciales
INSERT INTO integrations (name, api_key, is_active) VALUES
('Google Calendar', 'your-google-api-key', TRUE),
('Twilio', 'your-twilio-api-key', TRUE)
ON CONFLICT DO NOTHING;

-- Insertar plantillas de mensajes iniciales
INSERT INTO message_templates (type, content) VALUES
('Appointment Reminder', 'Recordatorio: Tiene una cita programada para {fecha} a las {hora}.'),
('Welcome Message', 'Bienvenido a nuestro sistema. Nos complace atenderle.')
ON CONFLICT DO NOTHING;
