Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321EC4A2054;
	Thu, 17 Sep 2026 23:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789688933; cv=none; b=Ucxwt3f2EH6FGdkQioef6c4Y+eroYE+J6czs98OtWCtRyCd8opp8HF8Srta7fs3voE0Di/Jpi723iae7meV5fNWkmrO+9dOiXZvM5G4jjN/B3DMElTlLNsY6SxBgjXmh3Ipy1067M7KJ27+pFamUqoDF8ucQvDcfHDqZsHQrnBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789688933; c=relaxed/simple;
	bh=2QI5XfqW3Fdp9U3D1RQKsGKRIOfv+kF48RCvh2y/Rkw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p5uJZ2mL/bdWdhcplOJkz7xpoJeJmrU9JT8Wp+u2jRoKTU8Tei2rYexf/CpCx7eesdNEggVHGa1sRhjMHyXrs8coQyaF0qZwQqTgJtbq2Kkmh34snYIjdD1MKlHLf3pcodN2GNkk81XM+N0QqVLL6C4+f9dYv4LMMicQOqsZ/go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXBuxdF+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXBuxdF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54EB1F000FF;
	Thu, 17 Sep 2026 23:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789688931;
	bh=IPD5K715vR2628pQ37HVcpNaeB/Rh+milt/XThMp+S8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IXBuxdF+SjzNY3dq9+IwbTiaKzhmGpJ3gI6JnU8WALS41i7ULFjs92fdgbxb/D+Cr
	 fSmdIBRZcldp6wJYEMyZOpGWFjvVCby+y2H0rbJYRX5+uiRgnLZfEMWvgfIeYk8PjK
	 +9TXMXvyN/+ASN6VJ9Dk+f8iT3c0+VSSowPLy0FlzOdzJVZolhzqE5aZcoLqCHVqnx
	 GYSq4f9LS3c7ZX0xENlLKRM1C/E8v+DmwAi/j6sgQ+dvrpBDYVJzvBlhcDL8khe5wu
	 IAOIzUv/i1kzkBCyYXiVRNIhOc4pqHUfGW4n7ttWGZIdPlVwI1G89luDhcyyVQwxHZ
	 E9Wa2LwpBHZNQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Erkan Erdem <hexvalid@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
 llvm@lists.linux.dev
In-Reply-To: <20260907103739.23212-1-hexvalid@gmail.com>
References: <20260907103739.23212-1-hexvalid@gmail.com>
Subject: Re: [PATCH v2] docs: kconfig: fix shell function syntax in caveats
Message-Id: <178968892166.1576026.5095321500689226365.b4-ty@b4>
Date: Thu, 17 Sep 2026 16:48:41 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=726; i=nathan@kernel.org;
 h=from:subject:message-id; bh=2QI5XfqW3Fdp9U3D1RQKsGKRIOfv+kF48RCvh2y/Rkw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlramIMC7sqXa6XH6yT7AhTe7trile1mWpG8KTaf7dqw
 iM3dgl1lLIwiHExyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgIkcfMTw30Nhc1DypWAOraVr
 d7L+/Hyz6DHTDK99hSfLfhuvOVsgV83IcDzkb9Zi/mXcuyWvPlD4sfV4Z2HIWdavYgsn+G6bqeg
 mxQsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Mon, 07 Sep 2026 13:37:37 +0300, Erkan Erdem wrote:
> docs: kconfig: fix shell function syntax in caveats

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] docs: kconfig: fix shell function syntax in caveats
      https://git.kernel.org/kbuild/c/ff87968e4e564

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


