Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www17.your-server.de ([213.133.104.17]:44200 "EHLO
        www17.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750904AbdGGOcH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Jul 2017 10:32:07 -0400
Received: from [95.222.30.97] (helo=localhost.localdomain)
        by www17.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.85_2)
        (envelope-from <thomas@m3y3r.de>)
        id 1dTTwW-0007V0-OP
        for linux-kbuild@vger.kernel.org; Fri, 07 Jul 2017 16:09:12 +0200
Message-ID: <1499436549.10537.1.camel@m3y3r.de>
Subject: How to fix UML build because of missing gcc-plugins?
From: Thomas Meyer <thomas@m3y3r.de>
Date: Fri, 07 Jul 2017 16:09:09 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

UML fails to build with gcc-plugins because the gcc-plugins doesn't get
build before the archheaders:


arch/um/Makefile:115: target 'archheaders' does not exist
make KBUILD_SRC= ARCH=x86 archheaders
arch/x86/Makefile:228: target 'archheaders' does not exist
make -f ./scripts/Makefile.build obj=arch/x86/entry/syscalls all
arch/x86/entry/syscalls/Makefile:69: update target 'all' due to:
arch/x86/entry/syscalls/../../include/generated/asm/syscalls_32.h
arch/x86/entry/syscalls/../../include/generated/asm/unistd_32_ia32.h
arch/x86/entry/syscalls/../../include/generated/asm/unistd_64_x32.h
arch/x86/entry/syscalls/../../include/generated/asm/syscalls_64.h
arch/x86/entry/syscalls/../../include/generated/uapi/asm/unistd_32.h
arch/x86/entry/syscalls/../../include/generated/uapi/asm/unistd_64.h
arch/x86/entry/syscalls/../../include/generated/uapi/asm/unistd_x32.h
:
Makefile:1155: update target '__headers' due to:
include/generated/uapi/linux/version.h scripts_basic asm-generic
archheaders archscripts
make -f ./scripts/Makefile.build obj=scripts build_unifdef
scripts/Makefile.host:107: update target 'scripts/unifdef' due to:
FORCE
set -e;  echo '  gcc -Wp,-MD,scripts/.unifdef.d -Wall -Wmissing-
prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89   -
I./tools/include  -o scripts/unifdef scripts/unifdef.c  '; gcc -Wp,-
MD,scripts/.unifdef.d -Wall -Wmissing-prototypes -Wstrict-prototypes
-O2 -fomit-frame-pointer -std=gnu89   -I./tools/include  -o
scripts/unifdef scripts/unifdef.c  ; scripts/basic/fixdep
scripts/.unifdef.d scripts/unifdef 'gcc -Wp,-MD,scripts/.unifdef.d
-Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer 
-std=gnu89   -I./tools/include  -o scripts/unifdef scripts/unifdef.c  '
> scripts/.unifdef.tmp; rm -f scripts/.unifdef.d; mv -f
scripts/.unifdef.tmp scripts/.unifdef.cmd;
  gcc -Wp,-MD,scripts/.unifdef.d -Wall -Wmissing-prototypes -Wstrict-
prototypes -O2 -fomit-frame-pointer -std=gnu89   -I./tools/include  -o
scripts/unifdef scripts/unifdef.c  
scripts/Makefile:35: update target 'build_unifdef' due to:
scripts/unifdef
:
arch/um/Makefile:150: update target 'arch/x86/um/user-offsets.s' due
to: __headers FORCE
make -f ./scripts/Makefile.build obj=arch/x86/um arch/x86/um/user-
offsets.s
scripts/Makefile.build:154: update target 'arch/x86/um/user-offsets.s'
due to: arch/x86/um/user-offsets.c FORCE

It looks like arch/um/Makefile calls recursivley archheaders on x86:

114 archheaders:
115         $(Q)$(MAKE) KBUILD_SRC= ARCH=$(HEADER_ARCH) archheaders

and then this rule gets build:
149 $(HOST_DIR)/um/user-offsets.s: __headers FORCE
150         $(Q)$(MAKE) $(build)=$(HOST_DIR)/um $@


but the target gcc-plugins is missing.

any ideas whats missing here?

with kind regards
thomas

