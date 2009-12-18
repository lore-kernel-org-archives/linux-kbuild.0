Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pmx1.sophos.com ([213.31.172.16]:52047 "EHLO pmx1.sophos.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753963AbZLRRlQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Dec 2009 12:41:16 -0500
From: Tvrtko Ursulin <tvrtko.ursulin@sophos.com>
Subject: Build error with 2.6.33-rc1
Date: Fri, 18 Dec 2009 17:30:42 +0000
MIME-Version: 1.0
Message-Id: <200912181730.42693.tvrtko.ursulin@sophos.com>
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain;
  charset="utf-8"
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, mhiramat@redhat.com, linux-kbuild@vger.kernel.org


Hi,

There is first thiw warning about gawk, and then the failure. Not sure if they 
are related. This build system has mawk installed (Ubuntu 8.10).

Error: Your awk doesn't support charactor-class.
Please try to use gawk.
  CC      arch/x86/lib/inat.o
arch/x86/lib/inat.c:24:25: error: inat-tables.c: No such file or directory
arch/x86/lib/inat.c: In function ‘inat_get_opcode_attribute’:
arch/x86/lib/inat.c:29: error: ‘inat_primary_table’ undeclared (first use in 
this function)
arch/x86/lib/inat.c:29: error: (Each undeclared identifier is reported only 
once
arch/x86/lib/inat.c:29: error: for each function it appears in.)
arch/x86/lib/inat.c: In function ‘inat_get_escape_attribute’:
arch/x86/lib/inat.c:44: error: ‘inat_escape_tables’ undeclared (first use in 
this function)
arch/x86/lib/inat.c: In function ‘inat_get_group_attribute’:
arch/x86/lib/inat.c:67: error: ‘inat_group_tables’ undeclared (first use in 
this function)
arch/x86/lib/inat.c: In function ‘inat_get_avx_attribute’:
arch/x86/lib/inat.c:85: error: ‘inat_avx_tables’ undeclared (first use in this 
function)
make[1]: *** [arch/x86/lib/inat.o] Error 1
make: *** [arch/x86/lib] Error 2
