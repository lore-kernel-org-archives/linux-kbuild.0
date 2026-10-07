Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CF347CA72;
	Wed,  7 Oct 2026 12:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376058; cv=none; b=XIgkFlfnKDXQ+885sh7sp1tIXG2a2qLtxJtpLrpRx0ehz7RrBzuFgrTEYBoDoPfcizSaVui9zq6Rb/e8bFQ4ypLPB36wgeV2Id8+JUcfzOB0jsl6NE+NRI0/nffdtXhe+2C4hW0/gw7EtiDax0QCGaFUfZwEMsFjxfI1mmUQx0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376058; c=relaxed/simple;
	bh=UtZRZiQgkWCtP62yXpq2Ma6eG37YOSOc+h24+aSIx5I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YEnm3TsK4JnwStqz42zwiY9j/QsHGR284qG+pvIItufVRDcYKxfLwq1j0G9TRc3l8vd1NUROOEg0MKnFqL59w7LH/rE1jePUuW12VFC8U+ys3vlOfGxk/wUGK33tY3cMDHWmNEkx7YzNPgbfRFovANeCM/Y1sre3r3VOwoKiHeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fY3OCVL5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fY3OCVL5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450841F0089B;
	Wed,  7 Oct 2026 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791376044;
	bh=1BsbcNHXax6I8CCFf6LcipFwcMcz8PqmA1oSsq6Pwzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fY3OCVL55b7IJFL5LZ6nEe2TZPa1HWNoswBFt3dPFAW7MAX2kzxoDnWV8S9Sw6HJg
	 0j9GPVVEuTSEsMvFGmYX3kmwnqHKnFGGZwuzX4y60NGJParlf9c2opjG8Oj34rSTnz
	 9pYPwCZADDWs87eYd0kc3k99iGJDtRx+8wwcSCB56hFR7HLhcpGbaFHQJep89cxx4S
	 XEAqIlSNo2uq1Fv1orYN6N885pt5aLjPmqBf2IKlYWnLEaIRWCsMKlBguttD6Rx+uQ
	 xCUtOpWfV+4Xj7DoJeE/UiNX0Y2yskLUFVpiCiTWOahZr2J8/jrdr3IDJZ6g1vxuJn
	 eygVMBsHxydrQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Ting-Han Hou <ue081723@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <CA+NtrhQqXgjT+4eg6W4P94Hc=DqdV3gQXz3EKKCxWvdWzfND6A@mail.gmail.com>
References: <CA+NtrhQqXgjT+4eg6W4P94Hc=DqdV3gQXz3EKKCxWvdWzfND6A@mail.gmail.com>
Subject: Re: [PATCH] checkkconfigsymbols.py: Parse Git status output line
 by line
Message-Id: <179137578902.1530818.14446580399575550007.b4-ty@b4>
Date: Wed, 07 Oct 2026 14:23:09 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=nathan@kernel.org;
 h=from:subject:message-id; bh=UtZRZiQgkWCtP62yXpq2Ma6eG37YOSOc+h24+aSIx5I=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnHrFaEfYpo/9N5PiC8xDF2yhL9iZd+m/J2hi1/9eNYd
 pbxwpUhHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiTZsY/jvet9ORlNJ0Wfli
 7xbDb3823yiTKfOqme4tFS29ja9S/DIjw4HrrPL3rvSL6Dodnt5XJ/nn5evT3y79Vl+muqDz++K
 t1XwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Wed, 07 Oct 2026 03:44:13 -0500, Ting-Han Hou wrote:
> checkkconfigsymbols.py: Parse Git status output line by line

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] checkkconfigsymbols.py: Parse Git status output line by line
      https://git.kernel.org/kbuild/c/72a61a7fef954

That said, if you are only discovering and fixing these bugs by telling
an LLM "please find and fix a bug for me", please use some judgement on
whether the problem is more of a theoretical one versus something that a
developer would run into the real world. Our time as Kbuild maintainers
is rather valuable, so having to look at a bunch of LLM generated
patches that fix bugs that nobody is likely to hit is not a good use of
it. A lot of these scripts are infrequently used or written for fairly
narrow use cases, so they might have problems against certain input that
is just not expected in practice.

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


