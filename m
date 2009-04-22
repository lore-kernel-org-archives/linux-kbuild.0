Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml110.kpnxchange.com ([195.121.3.14]:51561 "EHLO
	CPSMTPM-EML110.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751192AbZDVXMn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:12:43 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 13/14] deb-pkg: fix Section field
Date: Thu, 23 Apr 2009 01:12:41 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230112.42341.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

From: maximilian attems <max@stro.at>
Subject: deb-pkg: fix Section field

Section "base" has been removed, the base is defined by Priority field.

For Squeeze the section should be "kernel", but as that's not yet
supported for Sarge and Etch we stay with admin for now.

Signed-off-by: maximilian attems <max@stro.at>
Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: Andres Salomon <dilinger@debian.org>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 763edcd..b972d04 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -144,7 +144,7 @@ EOF
 # Generate a control file
 cat <<EOF > debian/control
 Source: linux-upstream
-Section: base
+Section: admin
 Priority: optional
 Maintainer: $maintainer
 Standards-Version: 3.6.1
