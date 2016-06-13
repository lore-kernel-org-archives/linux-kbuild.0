Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:11346 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1422681AbcFMVjb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Jun 2016 17:39:31 -0400
Date: Tue, 14 Jun 2016 05:38:08 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] Kbuild: don't add obj tree in additional includes
Message-ID: <201606140559.v8LZdIWP%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <1465852786-3559357-2-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: kbuild-all@01.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

[auto build test ERROR on kbuild/for-next]
[also build test ERROR on v4.7-rc3 next-20160609]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Arnd-Bergmann/Kbuild-don-t-add-to-include-path/20160614-052242
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git for-next
config: i386-tinyconfig (attached as .config)
compiler: gcc-6 (Debian 6.1.1-1) 6.1.1 20160430
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

>> arch/x86/realmode/rm/realmode.lds.S:75:20: fatal error: pasyms.h: No such file or directory
    #include "pasyms.h"
                       ^
   compilation terminated.

vim +75 arch/x86/realmode/rm/realmode.lds.S

b3266bd6 Jarkko Sakkinen 2012-05-08  59  	.bss : {
b3266bd6 Jarkko Sakkinen 2012-05-08  60  		*(.bss*)
b3266bd6 Jarkko Sakkinen 2012-05-08  61  	}
b3266bd6 Jarkko Sakkinen 2012-05-08  62  
b3266bd6 Jarkko Sakkinen 2012-05-08  63  	/* End signature for integrity checking */
b3266bd6 Jarkko Sakkinen 2012-05-08  64  	. = ALIGN(4);
b3266bd6 Jarkko Sakkinen 2012-05-08  65  	.signature : {
b3266bd6 Jarkko Sakkinen 2012-05-08  66  		*(.signature)
b3266bd6 Jarkko Sakkinen 2012-05-08  67  	}
b3266bd6 Jarkko Sakkinen 2012-05-08  68  
b3266bd6 Jarkko Sakkinen 2012-05-08  69  	/DISCARD/ : {
b3266bd6 Jarkko Sakkinen 2012-05-08  70  		*(.note*)
b3266bd6 Jarkko Sakkinen 2012-05-08  71  		*(.debug*)
b3266bd6 Jarkko Sakkinen 2012-05-08  72  		*(.eh_frame*)
b3266bd6 Jarkko Sakkinen 2012-05-08  73  	}
b3266bd6 Jarkko Sakkinen 2012-05-08  74  
b3266bd6 Jarkko Sakkinen 2012-05-08 @75  #include "pasyms.h"
b3266bd6 Jarkko Sakkinen 2012-05-08  76  }

:::::: The code at line 75 was first introduced by commit
:::::: b3266bd6ff52efb9e57c7fbfff4c8f7363dfaab3 x86, realmode: realmode.bin infrastructure

:::::: TO: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
:::::: CC: H. Peter Anvin <hpa@linux.intel.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--OgqxwSJOaUobr8KG
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
kuZtbvFwOjMV8zq4pgy0LAH4D/lCuQfEWQAA

--OgqxwSJOaUobr8KG--
