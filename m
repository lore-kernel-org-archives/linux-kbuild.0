Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AB23ECBF0;
	Tue, 31 Mar 2026 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950947; cv=none; b=L0540ZjF7p6eVJJT82uuZvSA2yE+ZaQYhzzW3avpglfQ+xEa0+Sroq7l52Zg5CtiB8k6q/qS/jztfjp8ugdwDRPg4xGKsg97wKCRkrfBFsKsOe210c0J7WUQWjfHIMhbe8zD0aLNEuDm+YsPLzhPw123Mi5aFxPzXm22n6tc4Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950947; c=relaxed/simple;
	bh=p35lCTaYzitbTsaaHtZ+8mC1gonp8g8QJsB2hUWCpIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mnp81dMHuo4mpTkPJ8SfudDxEY60B3julTqzy/fqJ1a4/2F+KgoWRcqqShPPjOaqZh1FCBNWJP1JLrhTTMbv2/6r3FP2KK4zbiJPQ1TfWbf7NGE9aDtCF+ORfLKYI4NNv1ZSODnVCiDv+yOLcLuA8KaEZ6RUx6SN8e9yZARMXGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bI5sCRV4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bI5sCRV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774950947; x=1806486947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=p35lCTaYzitbTsaaHtZ+8mC1gonp8g8QJsB2hUWCpIY=;
  b=bI5sCRV4Be8S4EX/651ag5yLAQP6J8EbpY7fAJz/Lya0UyT2DQFM40qA
   bZbelGaHvsBr4aYu6GqaBS+BZlKzdmQsIp+YQ2k3PxTC7jz+O+dfWSDAz
   VtuzwGZyVQwOBaqYWjmxUEdz6y9Jb5tkHJ6HjVDfefhTdYkuQORl6yr37
   cUtIxuF8a4tu+Ou67Sh+UcBr51NUid0t2NCwQU2eKpgI7dsBjjQY21TAf
   fUh7TBO5nAzObHyljCX04hsYZUrdcUnntnE3Yup4WjJDALCP7r8cLOQtf
   AArg2vuQCMo1LC3ovtEM8wrfEIm5uJIIJM0DgdVWTCrhTmBqhNOL/GuCx
   A==;
X-CSE-ConnectionGUID: rOjga6l6TW+qhF/iGXZ40A==
X-CSE-MsgGUID: UAgck+FrTf2im9NkcmIOxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79818308"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79818308"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:55:46 -0700
X-CSE-ConnectionGUID: UjURxnYYTAG2UJHcFOrGPA==
X-CSE-MsgGUID: 8SDizFruQlW+CzTtvjQV6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="227929241"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2026 02:55:40 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Vov-000000002VF-30uu;
	Tue, 31 Mar 2026 09:55:37 +0000
Date: Tue, 31 Mar 2026 17:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: xur@google.com, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Teresa Johnson <tejohnson@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v8 3/3] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <202603311757.MMr1YMxY-lkp@intel.com>
References: <20260330171920.2026779-4-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330171920.2026779-4-xur@google.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on dcc99abebfa1e9ca70f8af8695b6682ad7597bf2]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuild-move-vmlinux-a-build-rule-to-scripts-Makefile-vmlinux_a/20260331-012908
base:   dcc99abebfa1e9ca70f8af8695b6682ad7597bf2
patch link:    https://lore.kernel.org/r/20260330171920.2026779-4-xur%40google.com
patch subject: [PATCH v8 3/3] kbuild: distributed build support for Clang ThinLTO
config: x86_64-kexec (attached as .config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311757.MMr1YMxY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311757.MMr1YMxY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Makefile:2254: *** extraneous 'endif'.  Stop.
--
>> Makefile:2254: *** extraneous 'endif'.  Stop.
--
>> Makefile:2254: *** extraneous 'endif'.  Stop.
--
>> Makefile:2254: *** extraneous 'endif'.  Stop.


vim +/endif +2254 Makefile

^1da177e4c3f41 Linus Torvalds  2005-04-16  2251  
46b7c49254f89d SZ Lin (林上智  2020-03-01  2252) endif # config-build
2042b5486bd311 Masahiro Yamada 2019-08-11  2253  endif # mixed-build
688931a5ad4e55 Masahiro Yamada 2019-03-19 @2254  endif # need-sub-make
^1da177e4c3f41 Linus Torvalds  2005-04-16  2255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
