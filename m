Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml103.kpnxchange.com ([195.121.3.7]:52114 "EHLO
	CPSMTPM-EML103.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752512AbZDVXNA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:13:00 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 14/14] deb-pkg: bump standards version
Date: Thu, 23 Apr 2009 01:12:58 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230112.59384.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

From: maximilian attems <max@stro.at>
Subject: deb-pkg: bump standards version

Latest Debian policy is 3.8.1.
Even if we are not yet compliant to it strive for the latest.

Signed-off-by: maximilian attems <max@stro.at>
Signed-off-by: Frans Pop <elendil@planet.nl>
Acked-by: Andres Salomon <dilinger@debian.org>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b972d04..6faea61 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -147,7 +147,7 @@ Source: linux-upstream
 Section: admin
 Priority: optional
 Maintainer: $maintainer
-Standards-Version: 3.6.1
+Standards-Version: 3.8.1
 EOF
 
 if [ "$ARCH" = "um" ]; then
