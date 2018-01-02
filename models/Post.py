from sqlalchemy import Column, Integer, VARCHAR, DateTime, ForeignKey
from sqlalchemy.orm import relationship

from .Base import Base


class Post(Base):
    __tablename__ = 'Posts'
    idPosts = Column(Integer, primary_key=True, nullable=False)
    Content = Column(VARCHAR, nullable=False)
    CreationDate = Column(DateTime, nullable=False)

    Author = Column(Integer, ForeignKey('Users.idUsers'), nullable=False)
    # object of type User with id = Author
    author = relationship("User", back_populates="posts")

    NumComments = Column(Integer, nullable=False, default=0)
    comments = relationship("Comment", back_populates='parent')
