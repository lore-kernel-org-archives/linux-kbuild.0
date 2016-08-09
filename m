Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:64015 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194AbcHIIT2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Aug 2016 04:19:28 -0400
From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: [4.8-rc1] make bindeb-pkg O= fails
References: <CAPq9eC_WASMqBms=fYUs09vKj=DhNwEUswFbVMvaryMU2r35rA@mail.gmail.com>
Message-ID: <cf745f6e-0b02-7f63-4c8d-f61ad6a6ca32@nerdbynature.de>
Date: Tue, 9 Aug 2016 01:19:21 -0700
MIME-Version: 1.0
In-Reply-To: <CAPq9eC_WASMqBms=fYUs09vKj=DhNwEUswFbVMvaryMU2r35rA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Emese Revfy <re.emese@gmail.com>

[re-send]

On Mon, 8 Aug 2016, frank paulsen wrote:
> in 4.8-rc1 "make bindeb-pkg O=../debian" fails:
> | find: `scripts/gcc-plugins': No such file or directory
> | /usr/src/linus/scripts/package/Makefile:97: recipe for target
> 'bindeb-pkg' failed
> 
> this is due to a missing directory scripts/gcc-plugins if using O=
> 
> removing line 335 of scripts/package/builddeb helps:
> | (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
> gcc-common.h) >> "$objtree/debian/hdrobjfiles"
> 
> this clearly isn't the right fix, but i checked it anyway and the
> paket gets built.

This was introduced in 6b90bd4ba40b38dc13c2782469c1c77e4ed79915 ("GCC
plugin infrastructure"). Not failing hard when scripts/gcc-plugins
cannot be found, does the trick as well. But that too just papers over
the issue. Hopefully Emese has a better idea on how to solve this :-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index e1c09e2..89757f6 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -332,7 +332,7 @@ if grep -q '^CONFIG_STACK_VALIDATION=y'
$KCONFIG_CONFIG ; then
 	(cd $objtree; find tools/objtool -type f -executable) >>
"$objtree/debian/hdrobjfiles"
 fi
 (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts
-type f) >> "$objtree/debian/hdrobjfiles"
-(cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
gcc-common.h) >> "$objtree/debian/hdrobjfiles"
+(cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
gcc-common.h) >> "$objtree/debian/hdrobjfiles" || true
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd
$destdir; tar -xf -)


Thanks,
Christian.
-- 
BOFH excuse #269:

Melting hard drives

-- 
make bzImage, not war
