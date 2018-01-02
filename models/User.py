from sqlalchemy import Column, Integer, VARCHAR, DateTime, ForeignKey
from sqlalchemy.orm import relationship

from .Base import Base


class User(Base):
    __tablename__ = 'Users'
    idUsers = Column(Integer, primary_key=True, nullable=False)
    Login = Column(VARCHAR, nullable=False)
    Password = Column(VARCHAR, nullable=False)
    CreationDate = Column(DateTime, nullable=False)

    UserRole = Column(Integer, ForeignKey('Roles.idRoles'), nullable=False)

    NumPosts = Column(Integer, nullable=False, default=0)
    NumComments = Column(Integer, nullable=False, default=0)

    # Python only objects
    posts = relationship("Post", back_populates='author')
    comments = relationship("Comment", back_populates='author')
