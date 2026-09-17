Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E943DBD65;
	Thu, 17 Sep 2026 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632850; cv=none; b=O6vrA6sIwIvwrqgipddL9P5dLxkoeZUAKa0ZkCgMqJq20erozV4GVuBOioI9ne79XXOoiObGhXRU0I5TlLLRKKkC9a15Cwt8TyDSQSTpZmZOhpuP79Vnf+6LYGq6uJFq8CEZ/2oMfLU6TcI8BM9kaGo+8petqGpQEMQnCXeOlzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632850; c=relaxed/simple;
	bh=UuBMIp4LX8wMM0ojtI1Sq4elb6K9V0fC/w/Sr97jczs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VFKecKYF8yCflz2XggLSthprKsF94TE+dMyhniSObBxl9AD6qhexIIbIk36XeLPl9KnL2mbaLNljiO5bgxqPInSGCQ6Pi3fiD8YALGCcw+8DCNR9FKQKBTn8im06dNZMxl89g35+qCiHp+MGXTksh/+HKJf04fsJude9XfMEpPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5vE05Nf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5vE05Nf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789632848; x=1821168848;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=UuBMIp4LX8wMM0ojtI1Sq4elb6K9V0fC/w/Sr97jczs=;
  b=F5vE05Nfg9XGzEsdCZ0HsOjPUSHTaEeAC8xKlmibVlXZQDE+pSISiHlj
   rztWEfm8Rjv3sZ9d7h4MO63ocXwCvrmL8FmDudAhm7Rd6gx1zAlO9JEbs
   Opl3hcLWYZou3DbyktgKvyY04C/XXYCmrrgKsDdTHThU5VojQGFGbiPEv
   h8Cin+PbR4yeBi3Q2oJWhKPIC1hD03UT5Zdre1xrAHplt1H2qDMXaLkto
   Q+dhD8vlsSZNWyy2pQIo/Ucyte5xUbsy36ZYWCdguIYJB+BO3Jcc63HDg
   KUC7/lyU8V4dEm9nF+Tbfa/5X8c/6PfGVUMMZ8GtSEX6Ph9J8QFoNx43u
   Q==;
X-CSE-ConnectionGUID: vPHfXyGmTYudaZ3srZjrRw==
X-CSE-MsgGUID: 6qDVrC0qTkmZ9O5wDL9tPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101373976"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101373976"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:14:07 -0700
X-CSE-ConnectionGUID: TllQMIbgSAqqAAIZl/ZMFQ==
X-CSE-MsgGUID: XLDA4+jjQ6G5qELM6KDjgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271015282"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.60])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:14:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, Jason
 Gunthorpe <jgg@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: add header check facility as a manually run
 static analyzer
In-Reply-To: <20260916231319.GA550816@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260915104331.255636-1-jani.nikula@intel.com>
 <211fcac1-d85d-4680-8e55-598b2064a002@infradead.org>
 <20260916231319.GA550816@ax162>
Date: Thu, 17 Sep 2026 11:14:03 +0300
Message-ID: <67e8d510f7ea3e79035197c53ac215c23c8633ce@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Sep 2026, Nathan Chancellor <nathan@kernel.org> wrote:
> On Wed, Sep 16, 2026 at 03:24:09PM -0700, Randy Dunlap wrote:
>> On 9/15/26 3:43 AM, Jani Nikula wrote:
>> > There have been various attempts at adding a header test or check
>> > mechanism in the kernel build system. The header check primarily
>> > consists of ensuring headers are self-contained, have include guards,
>> > and, in some cases, pass kernel-doc.
>> >=20
>> > The main problems have been:
>> >=20
>> > - The dependency tracking creates undesirable artefacts (infamously al=
so
>> >   known as disgusting turds) in the build directory.
>> >=20
>> > - Gating the feature behind a kconfig option is complicated due to
>> >   allyesconfig builds. It's possible, but requires a verbose and
>> >   confusing negative proxy config option.
>> >=20
>> > - Naming the dependency tracking files with a dot prefix or placing th=
em
>> >   in a dot prefixed subdirectory in the build directory to hide them h=
as
>> >   been exceedingly difficult to achieve. (In part due to some Makefiles
>> >   building files in subdirectory hierarchies.)
>> >=20
>> > - The debate which headers, if any, should really be self-contained is
>> >   virtually open-ended.
>>=20
>> I would expect that headers in include/uapi/*.h should be self-contained,
>> but apparently that's just a pipe dream on my part, or maybe it's just
>> a maintainer option.
>>=20
>> With 'make HEADER_CHECK=3D"include/uapi/" headercheck'
>> I see over 70 errors (mostly typedefs or defined constants, but not only
>> those), such as:
>>=20
>> In file included from <command-line>:
>> ./../include/uapi/linux/hdlc/ioctl.h:74:21: error: =E2=80=98IFNAMSIZ=E2=
=80=99 undeclared here (not in a function)
>>    74 |         char master[IFNAMSIZ];  /* Name of master FRAD device */
>>       |                     ^~~~~~~~
>> In file included from <command-line>:
>> ./../include/uapi/linux/input.h:29:6: warning: =E2=80=98__BITS_PER_LONG=
=E2=80=99 is not defined, evaluates to =E2=80=980=E2=80=99 [-Wundef]
>>    29 | #if (__BITS_PER_LONG !=3D 32 || !defined(__USE_TIME_BITS64)) && =
!defined(__KERNEL__)
>>       |      ^~~~~~~~~~~~~~~
>> ./../include/uapi/linux/input.h:34:9: error: unknown type name =E2=80=98=
__kernel_ulong_t=E2=80=99
>>    34 |         __kernel_ulong_t __sec;
>>       |         ^~~~~~~~~~~~~~~~
>> In file included from ./../include/uapi/linux/papr_pdsm.h:14,
>>                  from <command-line>:
>> ../include/linux/ndctl.h:19:33: error: =E2=80=98PAGE_SIZE=E2=80=99 undec=
lared here (not in a function)
>>    19 |         ND_MIN_NAMESPACE_SIZE =3D PAGE_SIZE,
>>       |                                 ^~~~~~~~~
>> In file included from <command-line>:
>> ./../include/uapi/linux/patchkey.h:15:2: error: #error "patchkey.h inclu=
ded directly"
>>    15 | #error "patchkey.h included directly"
>>       |  ^~~~~
>> In file included from <command-line>:
>> include/uapi/xen/gntdev.h:159:25: error: unknown type name =E2=80=98gran=
t_ref_t=E2=80=99
>>   159 |                         grant_ref_t ref;
>>       |                         ^~~~~~~~~~~
>> include/uapi/xen/gntdev.h:161:25: error: unknown type name =E2=80=98domi=
d_t=E2=80=99
>>   161 |                         domid_t domid;
>>       |                         ^~~~~~~
>
> include/uapi already has its own header checking infrastructure under
> CONFIG_UAPI_HEADER_TEST and usr/include/Makefile, which avoids this with
> a no-header-test list that includes many of the files listed in these
> messages. To be honest, we should probably forbid HEADER_CHECK from
> including 'include/uapi' and refer people to use CONFIG_UAPI_HEADER_TEST
> instead, as there are other differences like being built under a
> different C standard or C++ and such that the existing infrastructure
> handles.

Something like this on top would fail if there are any include/uapi
headers in there:

diff --git a/Makefile b/Makefile
index 4851a4407149..77253506975e 100644
--- a/Makefile
+++ b/Makefile
@@ -1554,6 +1554,7 @@ header-check-targets :=3D $(patsubst %.h,%.header-che=
ck,$(sort $(header-check-file
=20
 headercheck:
 	$(if $(header-check-targets),,$(error $@ found no headers in HEADER_CHECK=
=3D"$(HEADER_CHECK)"))
+	$(if $(filter include/uapi/%,$(header-check-targets)),$(error $@ found in=
clude/uapi headers in HEADER_CHECK=3D"$(HEADER_CHECK)"))
 	$(Q)$(MAKE) $(header-check-targets)
 else
 headercheck:


I'll wait a bit for more feedback before sending a v2.

> That said, I think the overall idea seems fine and relatively clean, at
> least from my Kbuild perspective, as it is completely opt in, so the
> previous objection to CONFIG_HEADER_CHECK_DISABLE and widely exposing
> this to builds is pretty much moot.

Thanks Nathan and Randy, this feels encouraging. :)

BR,
Jani.

--=20
Jani Nikula, Intel
