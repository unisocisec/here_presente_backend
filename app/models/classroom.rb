# frozen_string_literal: true

class Classroom < ApplicationRecord
  DIURNAL = 0
  VESPERTINE = 1
  NIGHTLY = 2

  has_many :teacher_classrooms
  has_many :teachers, through: :teacher_classrooms
  has_many :call_lists
  has_many :student_answers, through: :call_lists

  enum shift: %i[DIURNAL VESPERTINE NIGHTLY]
  OPTIONS_WEEKDAY = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].freeze
  validates :name, presence: true
  validates :shift, inclusion: { in: Classroom.shifts.keys, message: '%<value>s is not a valid shift' }
  validates :weekday, inclusion: { in: OPTIONS_WEEKDAY, message: '%<value>s is not a valid week day' }
end
