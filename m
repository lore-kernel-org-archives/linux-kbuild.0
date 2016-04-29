Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:35468 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752595AbcD2Kn4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2016 06:43:56 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 2/2] kconfig-language: elaborate on the type of a choice
In-Reply-To: <gh60v04s4s.fsf@lena.gouders.net> (Dirk Gouders's message of
	"Fri, 29 Apr 2016 12:25:34 +0200")
References: <gh60v04s4s.fsf@lena.gouders.net>
Date: Fri, 29 Apr 2016 12:43:38 +0200
Message-ID: <ghwpng3db9.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org


The type of a choice can be specified explicitely or it will be
set according to members of the choice group, see menu.c:menu_finalize().

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 Documentation/kbuild/kconfig-language.txt | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index 14dd131..db10185 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -284,12 +284,17 @@ choices:
 	"endchoice"
 
 This defines a choice group and accepts any of the above attributes as
-options. A choice can only be of type bool or tristate, while a boolean
-choice only allows a single config entry to be selected, a tristate
-choice also allows any number of config entries to be set to 'm'. This
-can be used if multiple drivers for a single hardware exists and only a
-single driver can be compiled/loaded into the kernel, but all drivers
-can be compiled as modules.
+options. A choice can only be of type bool or tristate.  If no type is
+specified for a choice, it's type will be determined by the type of
+the first choice element in the group or remain unknown if none of the
+choice elements have a type specified, as well.
+
+While a boolean choice only allows a single config entry to be
+selected, a tristate choice also allows any number of config entries
+to be set to 'm'. This can be used if multiple drivers for a single
+hardware exists and only a single driver can be compiled/loaded into
+the kernel, but all drivers can be compiled as modules.
+
 A choice accepts another option "optional", which allows to set the
 choice to 'n' and no entry needs to be selected.
 If no [symbol] is associated with a choice, then you can not have multiple
-- 
2.8.1

