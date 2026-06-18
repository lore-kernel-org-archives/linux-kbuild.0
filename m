Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39C63101A6;
	Thu, 18 Jun 2026 18:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781808504; cv=none; b=J6f7VIRV6ejQsyxEdlcv/J3TnHQ9wEcZas5Gf/4c5wzDEzVKdAexMukVTZsXcOWUDpEOM1QI8iQ7l2lC0vCpWlGOtpOGsjv63dbokBOhxbTa1dw7wSwlOFdFp3b1yWk06KJjs+AyhSo7T+LBcnSFJjK0hvKydB+L2lK3LNqOUlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781808504; c=relaxed/simple;
	bh=a8lZKwtxR1QLFxofZSsJQp3G666Sh1vQXRGd8uxbTio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qQFqsxUUiZvW1x/FndjbKbkb95103hfCJptiIapQQO7qKLzFGyaUig+8aeJC5uBd8PTdEoStN3wlMbZik5+8P9v7603vheqLuNk84SKqjS0wOmjL41ApyPU52rGlLmqrLSDw+E+/U9UuuGIQC0CUcM0w/PAGPHeirV0o7DF1rFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FThec0mH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FThec0mH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33431F000E9;
	Thu, 18 Jun 2026 18:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781808503;
	bh=oCygmINPBsGBUc5gfARwpyZv5FtVdqPK1NwGays5SKI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FThec0mHCDVrZJtBHeW5ZSGmwYO9ZyoIRJbRuSqKpARopaLcxSIVOXD0AClVos5P3
	 Qq21qGipUfUGQZIH1z60MQO84Ql/TcP6zJNCcU95w0txz2xSm55Oq3BJJ4sUGQPPDv
	 gEwU45CDnFlgxX7hNfpMXz9a7lxVbLsM+NdMBML/9kBQGOZGmIuUfrgOxlxL/6pCEx
	 Xt3baxHbRWFbzIb+/PQmDFLTaADAwys3pGO1i0XK3nfbE4fwdEARppNqoybioS1Kae
	 VKKHCle/flcn+Hpl8z6bjeOKjpTsbtIH1aWNS59dmkjOzzthA7wsp3k56rbM2GWn21
	 5RO0/DfyRM2hw==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Siddharth Nayyar <sidnayyar@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 =?utf-8?q?Ren=C3=A9_Rebe?= <rene@exactco.de>, 
 Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, xur@google.com
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20260617224623.1346309-1-xur@google.com>
References: <20260617224623.1346309-1-xur@google.com>
Subject: Re: [PATCH v2] modpost: Ignore Clang LTO suffixes in symbol
 matching
Message-Id: <178180839980.3916864.18371872293093627065.b4-ty@b4>
Date: Thu, 18 Jun 2026 11:46:39 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=976; i=nathan@kernel.org;
 h=from:subject:message-id; bh=a8lZKwtxR1QLFxofZSsJQp3G666Sh1vQXRGd8uxbTio=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkmtsXsti1pUgZuLRe7U5cv2r+oYtp1+UChL/+yFkQwn
 3e5f4e1o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzkXgEjQ8PcWAbd9lMMzgUv
 AoXfibXukzlgcUGl8wXn90cPtBjyghgZHjkKTJ65OUmNnTW1dG387fkZvZWSskZNWxad0bl8YMI
 NXgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Wed, 17 Jun 2026 15:46:23 -0700, xur@google.com wrote:
> modpost: Ignore Clang LTO suffixes in symbol matching

Sashiko notes that the console variables may need the same fix but I
have tried building several configurations with distributed ThinLTO and
I do not see any modpost warnings so we can just wait to address that
until later if necessary.

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] modpost: Ignore Clang LTO suffixes in symbol matching
      https://git.kernel.org/kbuild/c/9a289cc425bf4

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


