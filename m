Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41873FF890;
	Tue, 31 Mar 2026 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969854; cv=none; b=WTskC/54/tdsuC4pDEDXs3RJWLoZfCT2wDSuDpH4XqfytJv5Dysw+iJiVH1/xQEN1BkF0SjuT8yC+kEGv/tDeKHJPHX88S91eoHQD6itsdXSF0WfzQumTIl/lIRypd+saABcmXZGS8WkXGFVItpkgVXRfh/mCXCZLSvKbGR/0Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969854; c=relaxed/simple;
	bh=J/vxD+W2Iis6zAcIQC0ZcGjV/9uRNeadS16aYX0r18I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFxtDZu/TBOrrBHG2fkJjEvXLiB+921x4Vbn6/iv9CS3k+QhYgoWhxe59x5z3Uacw+QdhsvR3jOOcriVKkZYq/iF7nKzzZ+t67OnpoVgGP/lr5vHcwCDiMqtGXV967/r/fRC3bOxBwcb6PR1BbNbaV7ZKwvHFlhHsgSyoTia7W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERdeWHm0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERdeWHm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774969853; x=1806505853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=J/vxD+W2Iis6zAcIQC0ZcGjV/9uRNeadS16aYX0r18I=;
  b=ERdeWHm076S4Tj6s6aK4R5O/IxJIQevJui+z/Tg1LkX5MVIaZRp3SrUn
   tFKOeFA+hlfxCJMOE01Dvme5bfBeIUZw3KX+RpffoCGV6yR0Z/BcfaH/4
   mk29TcNYOIizYexTvk2g8ZToqfhmPI+hHHwaj9CPy226r5BzIh5UsG2+t
   e9AZbLz0szRvPl9thRrGp3msp8ZMVh+8zhnwHiNK0RHjsR4OzwSEeHdXP
   YjfpB0COigiiWUMfCS+IcBN90EnXlr/l/k5pResgPsltw1mu1sk9Fekbj
   Xr1kIzmKVx9Az/gaUqbUcHg7mKVsVyimvQaGdzejFkfAZ4IRA2gkbEORU
   A==;
X-CSE-ConnectionGUID: r6iQ07OdSuWTsGwU3WKZ2w==
X-CSE-MsgGUID: ccqnBq6LSOyqZBcLdaEAYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86683716"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="86683716"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 08:10:52 -0700
X-CSE-ConnectionGUID: 7Vol1Sp7QgiMm+3TOLhVhQ==
X-CSE-MsgGUID: D88CbPKvQaq5ukI+YvYfyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226649384"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 31 Mar 2026 08:10:47 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ajs-000000008RR-2O5I;
	Tue, 31 Mar 2026 15:10:44 +0000
Date: Tue, 31 Mar 2026 17:10:39 +0200
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
Message-ID: <202603311739.cjetLeNT-lkp@intel.com>
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
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311739.cjetLeNT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311739.cjetLeNT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Makefile:2254: *** extraneous 'endif'.  Stop.
--
>> Makefile:2254: *** extraneous 'endif'.  Stop.
--
>> Makefile:2254: *** extraneous 'endif'.  Stop.
--
>> Makefile:2254: *** extraneous 'endif'.  Stop.


vim +/endif +2254 Makefile

^1da177e4c3f415 Linus Torvalds  2005-04-16  2251  
46b7c49254f89d5 SZ Lin (林上智  2020-03-01  2252) endif # config-build
2042b5486bd311d Masahiro Yamada 2019-08-11  2253  endif # mixed-build
688931a5ad4e55b Masahiro Yamada 2019-03-19 @2254  endif # need-sub-make
^1da177e4c3f415 Linus Torvalds  2005-04-16  2255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
