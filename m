Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:41519 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbfDAMoZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Apr 2019 08:44:25 -0400
Date: Mon, 1 Apr 2019 20:44:19 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [kbuild:build-test2 2/2] arch/s390/include/asm/uaccess.h:141:9:
 warning: 'rc' may be used uninitialized in this function
Message-ID: <201904012017.Zdcl8wje%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git build-test2
head:   dfc95c6ebbf550ee91f70b67c45396685bf4e055
commit: dfc95c6ebbf550ee91f70b67c45396685bf4e055 [2/2] compiler-attribute: stop forcing __always_inline to inline marker
config: s390-defconfig (attached as .config)
compiler: s390x-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout dfc95c6ebbf550ee91f70b67c45396685bf4e055
        # save the attached .config to linux build tree
        GCC_VERSION=7.2.0 make.cross ARCH=s390 

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/linux/uaccess.h:11:0,
                    from include/linux/crypto.h:26,
                    from include/crypto/hash.h:16,
                    from include/linux/uio.h:14,
                    from include/linux/socket.h:8,
                    from include/linux/skbuff.h:23,
                    from include/linux/if_ether.h:23,
                    from arch/s390/include/asm/diag.h:12,
                    from arch/s390/include/asm/kvm_para.h:25,
                    from include/uapi/linux/kvm_para.h:35,
                    from include/linux/kvm_para.h:5,
                    from include/linux/kvm_host.h:34,
                    from arch/s390/kvm/kvm-s390.c:23:
   arch/s390/include/asm/uaccess.h: In function '__get_user_fn':
>> arch/s390/include/asm/uaccess.h:141:9: warning: 'rc' may be used uninitialized in this function [-Wmaybe-uninitialized]
     return rc;
            ^~
--
   arch/s390/mm/fault.c: In function 'dump_fault_info':
>> arch/s390/mm/fault.c:127:15: warning: 'asce' may be used uninitialized in this function [-Wmaybe-uninitialized]
     switch (asce & _ASCE_TYPE_MASK) {
   arch/s390/mm/fault.c:177:16: note: 'asce' was declared here
     unsigned long asce;
                   ^~~~

vim +/rc +141 arch/s390/include/asm/uaccess.h

dc4aace1 Heiko Carstens     2016-06-20  113  
dc4aace1 Heiko Carstens     2016-06-20  114  static inline int __get_user_fn(void *x, const void __user *ptr, unsigned long size)
dc4aace1 Heiko Carstens     2016-06-20  115  {
0aaba41b Martin Schwidefsky 2017-08-22  116  	unsigned long spec = 0x01UL;
dc4aace1 Heiko Carstens     2016-06-20  117  	int rc;
dc4aace1 Heiko Carstens     2016-06-20  118  
dc4aace1 Heiko Carstens     2016-06-20  119  	switch (size) {
dc4aace1 Heiko Carstens     2016-06-20  120  	case 1:
dc4aace1 Heiko Carstens     2016-06-20  121  		rc = __put_get_user_asm((unsigned char *)x,
dc4aace1 Heiko Carstens     2016-06-20  122  					(unsigned char __user *)ptr,
dc4aace1 Heiko Carstens     2016-06-20  123  					size, spec);
dc4aace1 Heiko Carstens     2016-06-20  124  		break;
dc4aace1 Heiko Carstens     2016-06-20  125  	case 2:
dc4aace1 Heiko Carstens     2016-06-20  126  		rc = __put_get_user_asm((unsigned short *)x,
dc4aace1 Heiko Carstens     2016-06-20  127  					(unsigned short __user *)ptr,
dc4aace1 Heiko Carstens     2016-06-20  128  					size, spec);
dc4aace1 Heiko Carstens     2016-06-20  129  		break;
dc4aace1 Heiko Carstens     2016-06-20  130  	case 4:
dc4aace1 Heiko Carstens     2016-06-20  131  		rc = __put_get_user_asm((unsigned int *)x,
dc4aace1 Heiko Carstens     2016-06-20  132  					(unsigned int __user *)ptr,
dc4aace1 Heiko Carstens     2016-06-20  133  					size, spec);
dc4aace1 Heiko Carstens     2016-06-20  134  		break;
dc4aace1 Heiko Carstens     2016-06-20  135  	case 8:
dc4aace1 Heiko Carstens     2016-06-20  136  		rc = __put_get_user_asm((unsigned long *)x,
dc4aace1 Heiko Carstens     2016-06-20  137  					(unsigned long __user *)ptr,
dc4aace1 Heiko Carstens     2016-06-20  138  					size, spec);
dc4aace1 Heiko Carstens     2016-06-20  139  		break;
0b925159 Heiko Carstens     2017-01-02  140  	}
dc4aace1 Heiko Carstens     2016-06-20 @141  	return rc;
dc4aace1 Heiko Carstens     2016-06-20  142  }
c9ca7841 Heiko Carstens     2014-04-17  143  

:::::: The code at line 141 was first introduced by commit
:::::: dc4aace160165bd15400a79f9f5ab97405278f48 s390/uaccess: fix __put_get_user_asm define

:::::: TO: Heiko Carstens <heiko.carstens@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--huq684BweRXVnRxX
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--huq684BweRXVnRxX--
