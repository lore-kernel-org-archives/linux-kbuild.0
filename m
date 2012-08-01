Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hapkido.dreamhost.com ([66.33.216.122]:54000 "EHLO
	hapkido.dreamhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753683Ab2HADAE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Jul 2012 23:00:04 -0400
Received: from homiemail-a83.g.dreamhost.com (caibbdcaaaaf.dreamhost.com [208.113.200.5])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 4654F72A
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Jul 2012 20:00:04 -0700 (PDT)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_a3960237f9a31700eeb288d6a5364769"
Date: Tue, 31 Jul 2012 22:59:24 -0400
From: shea@shealevy.com
Subject: [PATCH] Fix firmware installation for images w/o subdirs
Message-ID: <663f65e29cc718b63ef0e2a769d03606@shealevy.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, linux-kernel@vger.kernel.org

--=_a3960237f9a31700eeb288d6a5364769
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8;
 format=flowed

On some setups (probably due to too new a GNU Make), firmware
installation fails with
*** No rule to make target `lib/firmware/./', needed by 
`lib/firmware/<file>.fw'.  Stop.
when a file in the top-level firmware/ directory is needed.

Original patch idea by Denys Dmytriyenko, see
http://permalink.gmane.org/gmane.linux.embedded.yocto.meta-ti/27

Signed-off-by: Shea Levy <shea@shealevy.com>
---
  scripts/Makefile.fwinst | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)


--=_a3960237f9a31700eeb288d6a5364769
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
 name=0001-Fix-firmware-installation-for-images-w-o-subdirs.patch
Content-Disposition: attachment;
 filename=0001-Fix-firmware-installation-for-images-w-o-subdirs.patch

ZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUuZndpbnN0IGIvc2NyaXB0cy9NYWtlZmlsZS5m
d2luc3QKaW5kZXggNmJmOGU4Ny4uNGQ5MDhkMSAxMDA2NDQKLS0tIGEvc2NyaXB0cy9NYWtlZmls
ZS5md2luc3QKKysrIGIvc2NyaXB0cy9NYWtlZmlsZS5md2luc3QKQEAgLTI3LDcgKzI3LDcgQEAg
ZW5kaWYKIGluc3RhbGxlZC1tb2QtZncgOj0gJChhZGRwcmVmaXggJChJTlNUQUxMX0ZXX1BBVEgp
LywkKG1vZC1mdykpCiAKIGluc3RhbGxlZC1mdyA6PSAkKGFkZHByZWZpeCAkKElOU1RBTExfRldf
UEFUSCkvLCQoZnctc2hpcHBlZC1hbGwpKQotaW5zdGFsbGVkLWZ3LWRpcnMgOj0gJChzb3J0ICQo
ZGlyICQoaW5zdGFsbGVkLWZ3KSkpICQoSU5TVEFMTF9GV19QQVRIKS8uCitpbnN0YWxsZWQtZnct
ZGlycyA6PSAkKHNvcnQgJChkaXIgJChpbnN0YWxsZWQtZncpKSkgJChJTlNUQUxMX0ZXX1BBVEgp
Ly4vCiAKICMgV29ya2Fyb3VuZCBmb3IgbWFrZSA8IDMuODEsIHdoZXJlIC5TRUNPTkRFWFBBTlNJ
T04gZG9lc24ndCB3b3JrLgogUEhPTlkgKz0gJChJTlNUQUxMX0ZXX1BBVEgpLyQkKCUpIGluc3Rh
bGwtYWxsLWRpcnMK
--=_a3960237f9a31700eeb288d6a5364769--

