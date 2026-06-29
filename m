Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25B836212F;
	Mon, 29 Jun 2026 10:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727874; cv=none; b=VGIDpFR/EoVHd+HHZi4xzBND6VKwAIm8qfQ3F/z//zmebNLTtsyM8WYtuPXOeO4U624spqCGUcfsY0opfvWYn/TRFsezqEjKFzC8L4+eBfl4hvOgyUSbTfeTYHrSMoOruxrjmd5s61R64qUrCjtSI7Y1g8Teu20vxtaJCtDr8os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727874; c=relaxed/simple;
	bh=4NV9RnqHoE/dp7UpBOxG6wmam3Ajuw+usvU+oNeaO+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lkr4kmJjcuePabngaoAvxfhPOGxtSJnby7dccR+QthGoHRzedeZnqWLErBgLrujYrEDNcZ39Ytgi/F3iDKT/Hdffoqyn0ATyfwanNAiSQKGRRAkhIndKtufcenEHPrkR069cCu9fz0/mc/3doi1VkwiG9d43/8f+wDXCeHB4VBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IApwJdU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IApwJdU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8F61F000E9;
	Mon, 29 Jun 2026 10:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727873;
	bh=718T54Qng3Y2sDbIyf9X3jGtl0LaVvw6Tvzl0ce34lM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IApwJdU2ZqWbajkTtMUzZ8hkIf1kIkY7rKk4nIGl0N4M7Q4h6kMSQeu1mxubo6xBo
	 p/cTwNO/brR3cY9fbWfDHc+UtI+7TwhcbWs9dt6NMezFP0mW7xKcRv3hxEMQHZa9z4
	 JxP6jTi/F4VqZEzqNWZHIXk8sM1x/6klaIX8SWi0HynOg+POCH9YkDR8gUDGdRDTw5
	 NrfvLOtng09tH/oRFtUZ6qVzGBqbnR8zHTswRMC6beDaAQC90Kf7i5lTDGRFLogITD
	 i8g9TB1hE6wM4emGS8/s1XOj8nxYUUDoUHnangvfzgeg6eaC9IBBjWYeiS8mWe+ygY
	 K/7gt5xug2HNw==
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v5 0/5] gpu: drm: nova: enable calling into nova-core
Date: Mon, 29 Jun 2026 12:11:04 +0200
Message-ID: <20260629101104.2971305-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622-nova-exports-v5-0-6191773fc977@nvidia.com>
References: <20260622-nova-exports-v5-0-6191773fc977@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 22 Jun 2026 22:30:06 +0900, Alexandre Courbot wrote:
> [PATCH v5 0/5] gpu: drm: nova: enable calling into nova-core

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/5] gpu: build nova-core and nova-drm from drivers/gpu/Makefile
      commit: ca524e273c43
[2/5] gpu: nova-core: export Rust symbols for nova-drm
      commit: 3b7b7ad78fd2
[3/5] gpu: nova-core: emit Rust metadata for nova-drm
      commit: 0dc79ddc9f6f
[4/5] gpu: drm: nova: depend on nova-core and use its symbols
      commit: f1bd7119ac4c

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
