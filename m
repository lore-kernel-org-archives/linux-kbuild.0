Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B5B46F480;
	Wed,  7 Oct 2026 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365244; cv=none; b=q97Z8MoLOyYX0AjbR9uXWO/JbN5+br2uk2KhLK8pV+YlWZu20gJy7lMaSdFujJCJ7BssfZq1H3KGCy/PKvTIqcCd59ocO3Z8AESE+ka7jf6aSdc/cX89950EW5Vo4QsKgjnCBtAMD21ugDhxu11XTpcpqNBgb1VG6MyPX7vvWNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365244; c=relaxed/simple;
	bh=EC73LykYJHw+jAwdh/3czAsy5fXqHWhCA/lPwOUVncU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Bxskn/F3k1g/70+KPoPKfhugJdLBQLttNPnesenyZ7jJIW43bvSb8sBEfATvzw5RS/QUZQgtn5tH3J5SKSof8IJVJ9XTtiW8/0AoZVwMufNwg1xN6VeWzK1XLPRXoJRIdnwP/8eZxP+QzqT8wdtkJzao0kTVb9c6qxFq06l0cek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TpIish9u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpIish9u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232551F0089B;
	Wed,  7 Oct 2026 09:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791365218;
	bh=APbFXQXsXQiep4JdRrbvfH90pOnRYqNCWmwAKUBpF+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TpIish9u+WfYHMXIZYfVV/3W8/jiCTBZAVe1XyJ4BnrOeA9GqTyVlYZI15NZglpqO
	 GVfs3uUNcgd7jivYsPRB+nAJdfveVWEstwvlPJnJcK7sT45ZveHjPSycaTBx06owjZ
	 XGSTIvu5gWnsRNJmefuhSuzUrtRCduSPMf3Ag092Pj7rdC7D/RbA4B2t2tS5xp+eof
	 kBvA3J+ippnSPiOnxR0/3t93xukKhIH2If9Rz4bQnmJVAw6F4XJ2Jeu9OKYhwDyrhQ
	 iH0LT8R3QVTbxB3m+L/+dZ5jIH8ugWFgkb+V/a6C0hcyAK0h7JQASnReeKFiWq4nvA
	 8zSfiYbZmqKIg==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, lzhan011 <lzsx618@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261005085729.872402-1-lzsx618@gmail.com>
References: <20261005085729.872402-1-lzsx618@gmail.com>
Subject: Re: [PATCH] gen_init_cpio: stop parsing on lines with a missing
 argument list
Message-Id: <179136520162.1527194.9223276311672277059.b4-ty@b4>
Date: Wed, 07 Oct 2026 11:26:41 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=751; i=nathan@kernel.org;
 h=from:subject:message-id; bh=EC73LykYJHw+jAwdh/3czAsy5fXqHWhCA/lPwOUVncU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnHBILuVdfs4HxV8yvUu8A9/M3nx0smvklV5HfJ4Teer
 9Gzn0O5o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzk8WxGhh15TYdVjC+mTj7w
 J36+kE3eD9XWniMOSxc+ENkbvV+5J4Hhr/RK44je87P3muQ8KHYU/Ddn6ndJ+S67vW597RueTtz
 YygUA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Mon, 05 Oct 2026 03:57:29 -0500, lzhan011 wrote:
> gen_init_cpio: stop parsing on lines with a missing argument list

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] gen_init_cpio: stop parsing on lines with a missing argument list
      https://git.kernel.org/kbuild/c/4677a58a643f9

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


