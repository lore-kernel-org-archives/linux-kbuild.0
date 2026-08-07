Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723F83E63A8;
	Fri,  7 Aug 2026 21:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786137786; cv=none; b=MCS9xe12lC5TVjfs0ioDA1fvxCADreCX+WpA9yLpXuIh4AZOprFv9MmhLQ0nYFDcfAm1MwkDoFldzj/EEJ3wA1z5uGKbdkddiMz25wgp8/S1mb9+clEmRZkxxAxpuGO8a6m4FsY/eddMPpN3OC0F/9YMklCfprobfZZKXYzXOuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786137786; c=relaxed/simple;
	bh=a4ZMI+CClZgi+Ry1jWUbFr0J0qgC5VvoyGRfiEtQNFc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=OCl23NCaChw+m2DlT1abFzH/RSUOT95wRPG9zEN5G7PJX+MdFbApU5fTcdPTWabI3ZDRbj0FXQkol1rzdh3T4t5S7dIJv/gbxtTgbQpq59+2Iywz4Axrk34dNWl+2WX0usHFTbF0y00UdbIfyWdEqQmJIqppAwgFTsZ4kZbLdpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wx0w/n4P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wx0w/n4P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3C51F000E9;
	Fri,  7 Aug 2026 21:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786137785;
	bh=Ciuuv4MvSWacj/mCjkUqQXFFvmTmGRFmcz74XC8rBgc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Wx0w/n4PTEPu00NXxMzqnURJEUQjB6/T623+P00xD66mW9lTuiYGOKsvnfet+jNdk
	 DkZKl3BeXV19lC4IInQBi15fJtpWeAbrFh74sKKYr596Fb+tMAAv8Hksa37swIgtqt
	 mrh22H4KRcR4E58L0/qaFj0ZEo+HGeNCMCpSYcR37HGuqMD1nuprARVB3kL6q/PXX5
	 ZxwU6NO27v2uyraswreF1JrwgvYylDYFecX640joG/MX/VddKQMqRXQ72SwO5eHDsy
	 qM3y/EClNYe9ueiMI3iDERnK+rlc+1jDjPb99sEc7I4zwUBx+JTygTHGitm+kKwWUs
	 qwSY62Y5cTR/Q==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/2] modpost: error logging cleanups
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
In-Reply-To: <cover.1786120005.git.jani.nikula@intel.com>
References: <cover.1786120005.git.jani.nikula@intel.com>
Date: Fri, 07 Aug 2026 14:22:57 -0700
Message-Id: <178613777751.32781.14792177228607560956.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=814; i=nathan@kernel.org;
 h=from:subject:message-id; bh=a4ZMI+CClZgi+Ry1jWUbFr0J0qgC5VvoyGRfiEtQNFc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFllPtsjNuZMbM724kjcLJPyKKqZI66t9u0eT85fdyJf/
 al48om7o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExEQYThfwXveuO9jmseG07l
 s1yzTMT+k06NisSzuC/7nn6YxPptuxEjw3LpF+dXic4/lL0w8kX/RZ36zUyrKuqEpDZpRqitiXF
 l5AQA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> I was doing some refactoring, and kept hitting modpost errors and
> warnings. It was getting a bit annoying that a lot of the modpost
> messages have different formats for modules, and different quoting for
> symbols, sections, and namespaces.
> 
> Clean them up a bit.
> 
> Jani Nikula (2):
>   modpost: add module as parameter to modpost_log()
>   modpost: use mod_warn() and mod_error(), clean up logging
> 
>  scripts/mod/modpost.c | 112 +++++++++++++++++++++---------------------
>  scripts/mod/modpost.h |   8 +--
>  2 files changed, 60 insertions(+), 60 deletions(-)

Thanks, this definitely seems like a nice cleanup! I have definitely
noticed how inconsistently modpost messages were formmatted in the past.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

