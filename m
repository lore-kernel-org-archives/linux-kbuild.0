Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881849892B;
	Wed, 23 Sep 2026 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160082; cv=none; b=m/RoiENeAs6sMAGadnjGW5Ud5zTQiNrA3VKH6um7olA8HKMAhMdK/GxkPND45dheo/jmjOyyPbohGdbm9uvnrHvPh2RF0ZzaJHAW9Ll7+KO6NvekJ1OkwT9clwnKGAGxmyDnyjs+zOXwEoT+By8JID6dxYqyNVr9+OmRDAbRuhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160082; c=relaxed/simple;
	bh=YbExH4H+VywVj0LlHnauiCI7bN1MNBtpB0WFNy9TNrU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hMcILURx9r9z8xmb5gPHl7Rwjldas1GX0Sf2uX7U9ciltBgVKjuW5AwUGRUDoTEav10bWRTmHP2JBpsVeCZVxxjjWq3WLfjRPauWgmIcqdM05U6Pkl6P5FHICzraJlim6utSkwBjQGI0ORP8l5sa9hMSjsDtqbSzBq6byMHhNmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLZ3Dhxx; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLZ3Dhxx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790160068; x=1821696068;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=YbExH4H+VywVj0LlHnauiCI7bN1MNBtpB0WFNy9TNrU=;
  b=kLZ3DhxxRS6j7VsxzlbCtAB5qrWQISWgZL75vAiSukYirxFqGvwHnqEJ
   sDcJS/D4BLDL+6TSFR2pApXsDHl7Pz7uhKV8Dt2v7AaEpaAGnGtsMZ9tO
   hsvr41PvXathmpSDkEu8F50NkKZlseDkw69aZnGGA0kZtw5P05hBjLNM1
   7jgDDCewZ0L2ZGAGbZ4n8RBHSpNGV/m40tekwDL6vDqYjGHcPPajBWPij
   IGsfjoqOG5n4xz6rrc0CXkN2h06lt09Pl0UC8PwdQJ76dwYllGFuk/44O
   81r+ypCehQLrR5MCtSZYAGMIJAD8lGHDqbMv7Trf/yv0Fu3NyP5RHg3q/
   A==;
X-CSE-ConnectionGUID: X0JQ+locTrWw6hhRPL7nzw==
X-CSE-MsgGUID: yt2/sqx4TpS5YJcUJ1lXoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1334486"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1334486"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 03:41:02 -0700
X-CSE-ConnectionGUID: mWAnkwTERbumH6v+ijE1jg==
X-CSE-MsgGUID: SkQU3ri2TYq+jaUEdNumqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="278285762"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.253])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 03:40:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier
 <nsc@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Masahiro Yamada
 <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: add header check facility as a manually run
 static analyzer
In-Reply-To: <20260917171722.GA356152@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260915104331.255636-1-jani.nikula@intel.com>
 <211fcac1-d85d-4680-8e55-598b2064a002@infradead.org>
 <20260916231319.GA550816@ax162>
 <71a8b988-3977-44e4-93d6-782e4447f160@t-8ch.de>
 <20260917171722.GA356152@ax162>
Date: Wed, 23 Sep 2026 13:40:57 +0300
Message-ID: <80690e33ca5d2eb3cdbe5b84f75b2af39e3b8423@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Sep 2026, Nathan Chancellor <nathan@kernel.org> wrote:
> On Thu, Sep 17, 2026 at 11:05:32AM +0200, Thomas Wei=C3=9Fschuh wrote:
>> On 2026-09-16 16:13:19-0700, Nathan Chancellor wrote:
>> > include/uapi already has its own header checking infrastructure under
>> > CONFIG_UAPI_HEADER_TEST and usr/include/Makefile, which avoids this wi=
th
>> > a no-header-test list that includes many of the files listed in these
>> > messages. To be honest, we should probably forbid HEADER_CHECK from
>> > including 'include/uapi' and refer people to use CONFIG_UAPI_HEADER_TE=
ST
>> > instead, as there are other differences like being built under a
>> > different C standard or C++ and such that the existing infrastructure
>> > handles.
>>=20
>> Testing the UAPI headers here too would still be valuable.
>> CONFIG_UAPI_HEADER_TEST tests the headers from the perspective of
>> userspace after they have undergone processing. The kernel build
>> might see the same headers quite differently.
>>=20
>> For instance the example from above:
>>=20
>> ./../include/uapi/linux/input.h:29:6: warning: =E2=80=98__BITS_PER_LONG=
=E2=80=99 is not defined, evaluates to =E2=80=980=E2=80=99 [-Wundef]
>>    29 | #if (__BITS_PER_LONG !=3D 32 || !defined(__USE_TIME_BITS64)) && =
!defined(__KERNEL__)
>>       |      ^~~~~~~~~~~~~~~
>> ./../include/uapi/linux/input.h:34:9: error: unknown type name =E2=80=98=
__kernel_ulong_t=E2=80=99
>>    34 |         __kernel_ulong_t __sec;
>>       |         ^~~~~~~~~~~~~~~~
>>=20
>> These are legitimate issues, the inclusion of the necessary header is
>> gated behind #ifndef __KERNEL__ although it should not be.
>
> Hmmm, fair enough. I guess we can leave this functionality in place for
> UAPI headers then but I just worry about people doing what Randy did and
> reporting these issues when they are already known and handled in some
> other way. Maybe the UAPI header test could grow an "internal kernel
> usage" check similar to the other checks that it has at some point then
> we could forbid HEADER_CHECK=3Dinclude/uapi but it is fine for now.

Do you think the patch at hand is good to go, then? Anything further you
need from me?

BR,
Jani.


--=20
Jani Nikula, Intel
