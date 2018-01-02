from sqlalchemy import Column, Integer, VARCHAR, DateTime, ForeignKey
from sqlalchemy.orm import relationship

from .Base import Base


class Comment(Base):
    __tablename__ = 'Comments'
    idComments = Column(Integer, primary_key=True, nullable=False)
    Content = Column(VARCHAR, nullable=False)
    CreationDate = Column(DateTime, nullable=False)

    Author = Column(Integer, ForeignKey('Users.idUsers'), nullable=False)
    author = relationship("User", back_populates="comments")

    ParentPost = Column(Integer, ForeignKey('Posts.idPosts'), nullable=False)
    parent = relationship("Post", back_populates="comments")
