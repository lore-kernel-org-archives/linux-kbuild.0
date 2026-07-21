Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA153A6418;
	Tue, 21 Jul 2026 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644265; cv=none; b=aTyKN7DBocppqz0P+QYHeodgW/xfpK4A+fJ23lEc1BgQSqiCDfqM8fdEe/ai+rwDjiDw6wj+cskaEaRF+cqdPvsBR2FpkT+WtiONp8EOAoM5SYZqFAD8n8HWYLwXSPIafRLHbfZ6Id+jRUQZaX3PwvlhRbLViQweiMUKFk91Jz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644265; c=relaxed/simple;
	bh=rRxUUUghNBiNMXycucAYkTHZohWN/DYz+Z36Solm1ho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G6J5SepCwbRvkHIFzQHnrzmzmGbW0eDkcMEghYI4NIK7pjo2e3IB/EVHqEU5FSRTJJKu22rHKF0zjg6tM0GJhENW7B7h/LBQoN3zX9pMrblsnWG/r7DKxwiSjboGJ6mKEi2fEAkvrtXFrZexRhZubTB0Oc5+cGp66RK1wP7UT+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFwKzPJJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFwKzPJJ"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5A83B1F000E9;
	Tue, 21 Jul 2026 14:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784644264;
	bh=9hiL2eCGhd99TPnx/KWI9gnHAqh3MB5xiWqEJLPTrSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PFwKzPJJKZSAY7B+VwE/+5WHKRODeP9CNEk959h55xt8kc9ufW87KIc2SMwbWVitW
	 1s/PqdmwGM6mP1uiV3wADAXGF5fURGGECQbJnkLnjUy9MdzsYvkppSrSgEtos2Gv0V
	 jtnMWVC/HLEA2X+uQZOCRKprnK55tJOgzjuWOVoICm50l5dsdy62c9W5xFcu7p4yDl
	 zTcix6zHhSWdTKhMQU5WQHZ4Aiyxh32FcpSb6zQJDWwsVA+WPqyV6PkFUwnDYTNnzG
	 bu8lOgGB7QE16fjYGOKgZj3FCZPH6YUV3LU2jrlXUvdya4phjH0TBC3Xy9/2nt6mbF
	 K0U5Y2cYy3jFg==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org, Julian Braha <julianbraha@gmail.com>
Cc: vegard.nossum@oracle.com, kees@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260719210536.9577-1-julianbraha@gmail.com>
References: <20260719210536.9577-1-julianbraha@gmail.com>
Subject: Re: [PATCH] kconfig: fix minor typos in comments
Message-Id: <178463114278.1439086.2101812055158111071.b4-ty@b4>
Date: Tue, 21 Jul 2026 12:52:22 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=690; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=rRxUUUghNBiNMXycucAYkTHZohWN/DYz+Z36Solm1ho=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqX09wgIbuTv4vxC0KDcjOhEZkjLkIEUcj/eA3w
 z+Le0awBQCJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCal9PcAAKCRAHUgpwFiYS
 accXD/9trDJvFaveTXjFyg4HlvQxfxji1YVuEpJsHppmL0EGJZxYNLk++vEiX7NUbVjsP/19vsr
 5u4/nyZ02XiAlbntBF6oL/VmKg/hZ64WF9eSzy8n2WpbQY+UdUJSaQosJCjt04hli0ybA+xLL6B
 MNUy3J51HPdcCcuRePbKj2RHTCU0q7deuZPJepuv6sMbyBxdYwqkS9dK027eJueUkdKWP4n9JdG
 dTtYX0akZ6TNNOrYKiSaWf59kGbrLEiMAWo2FgzjvNaormKMSoLKznV5NwpgUS/a1ld5nbI3s91
 XJfpqC+i+cjdT1N1Pe6sjZfX022N+rY8USlKZpoccEIZeK4kUGvs6lsyNdFKI8UmpX8EBHQn7Qg
 OD9WHhGLgQ+ud1dvd4k/JPqXHdUouCkxfYGzKJp2S1tuzdGE1lsE0md970E8RrwGhEOs67WufCL
 +AqXFFyHHpE2H+PbhOOCi3IzRdd0k3GuUOSdgbCRx24tq8jjQC3Z3jALTOUfx/mCM5YELIRrQwN
 1pR/6bbkwJy+hA/jkwwC/qdQJcvjTDhE/+iY4s9axmefJnnuXMQkrE/XBpwDjnPJQ2wt7rcE6ra
 TtbHDtpv5XycS1euAEo/+LoeSBPakChnnZ5838PEVhE2Db779aC+62D7F6RxlxftUDfLm9IKpFQ
 g/58V3N2ML5ReQg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Sun, 19 Jul 2026 22:05:36 +0100, Julian Braha wrote:
> kconfig: fix minor typos in comments

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kconfig: fix minor typos in comments
      https://git.kernel.org/kbuild/c/0a548a29

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas


