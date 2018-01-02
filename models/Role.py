from sqlalchemy import Column, Integer, VARCHAR

from .Base import Base


class Role(Base):
    __tablename__ = 'Roles'
    idRoles = Column(Integer, primary_key=True, nullable=False)
    RoleName = Column(VARCHAR, nullable=False)
