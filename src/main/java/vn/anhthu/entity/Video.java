package vn.anhthu.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.*;
import lombok.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "Videos")
@NamedQuery(name = "Video.findAll", query = "SELECT v FROM Video v")

public class Video implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "videoid")
	private String videoId;

	@Column(name = "active")
	private int active;

	@Column(name = "description", columnDefinition = "nvarchar(500) null")
	private String description;

	@Column(name = "poster", columnDefinition = "nvarchar(500) null")
	private String poster;

	@Column(name = "title", columnDefinition = "nvarchar(500) null")
	private String title;

	@Column(name = "views")
	private int views;

	@ManyToOne
	@JoinColumn(name = "categoryid")
	private Category category;

	// bi-directional many-to-one association to Favorite

//	@OneToMany(mappedBy = "video")
//	private List<Favorite> favorites;
//
//	// bi-directional many-to-one association to Share
//	@OneToMany(mappedBy = "video")
//	private List<Share> shares;

	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
