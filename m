Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B0F257845;
	Thu,  6 Aug 2026 12:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020219; cv=none; b=D6Ol6/6m6zUXBnf/9cuQ5hUcR40cLmkqDNCRJVgnClEdoTZOSC0uVvdIcljpOQVP4gVG4ldrbqwxq4koEBBjX8imMx2Prw/xzoGAT04nstnqsEmQJjy8E5xpqFBbEz2HuXqV27YiXQ7PqaLQDqzHPv/XK4VOOho5SBWP9saSmcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020219; c=relaxed/simple;
	bh=fVcGdIr/dtMfYJw9VpWAs6VnKHKzA5ZGNOjloCem1yI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ldtiGMxmS30qqyqcN07yLpzmv4g/wJl9XM/niTzD2HwDh2HaZpxZPPuxdRKl4pFA8z2RrWWh8D6TSBWg8RI6ziUOgSj0C5kI9GyAKGOoP9hQ79rowICc+jz6xQM4smGk4SYRTwtzmxs2/M0JSfVFchNUXUTM5et6xtMrmnN8UiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fveR5hJt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fveR5hJt"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C6F671F00A3A;
	Thu,  6 Aug 2026 12:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786020218;
	bh=wu/hc3B4sUYs59GrCAeju8VE0zwF43AdqUZ4Fyqpeuo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fveR5hJt9dF/AazWqjOYRG7Pw2LCO9vfACi5sfJ9ko7VntEEpyzsM/U1OBh3VDTAZ
	 fmTh4jNhkUh5pXv2x2JDTA0WuM5+yPqYmL395Hr+jq6Mc2V8HgaYVI421TCnMKanPk
	 JGG6eYcisa66W/v0zabrqSXn+Ub4w8QvRCMHkyyXxRXAXwpTtQLtZNk6G+oilu/aqA
	 KLrgx9bWFtU+JKQSDBcDn5NgsjYssvoMEsXoLQjdSPvk4uUgbHuetPMfJa/kQWRe0x
	 Ih/UqGgRL8CxYSFvmbDjV92+y8+2NtAd43O7RDnEe76GXnZsahHHCctDhNpOhLvhPX
	 c9x8XTMP+Roug==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org, kees@kernel.org, 
 Julian Braha <julianbraha@gmail.com>
Cc: xry111@xry111.site, hyc.lee@gmail.com, jeffbai@aosc.io, 
 vegard.nossum@oracle.com, rdunlap@infradead.org, grahamr@qti.qualcomm.com, 
 nico@fluxnic.net, masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260801145238.2140291-1-julianbraha@gmail.com>
References: <20260801145238.2140291-1-julianbraha@gmail.com>
Subject: Re: [PATCH v2] kconfig: fix submenu rendering of negative
 dependencies
Message-Id: <178601989987.3769299.11655387246373515994.b4-ty@b4>
Date: Thu, 06 Aug 2026 14:38:19 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-5acee
X-Developer-Signature: v=1; a=openpgp-sha256; l=728; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=fVcGdIr/dtMfYJw9VpWAs6VnKHKzA5ZGNOjloCem1yI=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqdIBAKLfWlKpWZxSUa/ZlpztXnBFSSDmN5IFot
 frnbOAIiVqJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCanSAQAAKCRAHUgpwFiYS
 aRu9EADtQUxfLKTKl47CNMFqjgSi/4LLPX7uSTQTMA50l0UsXiyx5IoWAUEnERJhNik5jlhIpTL
 B6azUN6AMryBMZ9+lShRp/yQu4CaSjtyDWAW6aJKdlpE9FMyZ0mA2W2M5XHPlSAJ78tD65KEHNF
 Hu8l0pyOh+ia3Gy7JxMxS1fBzhXNT2jkgmEGtn7xoKWU6qIywnnX4Nix6Dtp/fhIJ3TMQGuUSEi
 Pw/Ik5Sf1aqntqgM69Diu8k1ewJgxH0gTsnaxxgoEU2Oa1by/5agAffirlHxfnNSzF1Kzvk0n7B
 dvOSW6XcX0KVeC4r+cfcjPUw5Pr5DASPIWmOm+CAwt6OV9UdVeu26QQ4Y/ilzrxI13+DIb68uHe
 J4lMbm3vuSnSW2zcUypSqiL+1pWQpDKpKB433i0MC6ZJgnjY/2CbKLG0OzHPNRZDLJNaBny/Hy7
 iaFziA5GP61oW05uOiRChdNVNJfRwGcgiHSddHpDHBbVrow0E0GTtM6lzd8V5uR2wXXRA7HrLCz
 W/gXbeaheuZfKi3mqdcXDOMF1F/EjFys3TGswZ+462wR+MxkXSkDiRcgCuXr7C0nGFXw5It+mRi
 XcA+n0Kj4gC6/V5Hrw6rWN5UGV72FvVuBsp93Nd5BoNiObMvK5a4EG6ngEP2YSNvsWAN9JgdPdC
 OIvD0DCl1xLGsdA==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Sat, 01 Aug 2026 15:52:38 +0100, Julian Braha wrote:
> kconfig: fix submenu rendering of negative dependencies

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kconfig: fix submenu rendering of negative dependencies
      https://git.kernel.org/kbuild/c/8fbf553d

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


