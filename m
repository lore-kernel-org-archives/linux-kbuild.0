Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml110.kpnxchange.com ([195.121.3.14]:51422 "EHLO
	CPSMTPM-EML110.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751043AbZDVXLq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:11:46 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 10/14] deb-pkg: improve Source field
Date: Thu, 23 Apr 2009 01:11:43 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230111.44655.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

The Source: field is defined as the source package in the package
archive from which a binary packages are built. As deb-pkg does not
generate a source package, we should avoid to use any existing source
packages here.

Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: maximilian attems <max@stro.at>
Cc: Andres Salomon <dilinger@debian.org>
---

I still have strong objections to "linux-2.6".
IMO "linux-upstream" is a good compromise: it's clear and avoids both
Debian's "linux-2.6" and Ubuntu's "linux".

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 60f8de2..ebb112d 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -114,7 +114,7 @@ maintainer="$name <$email>"
 
 # Generate a simple changelog template
 cat <<EOF > debian/changelog
-linux ($packageversion) unstable; urgency=low
+linux-upstream ($packageversion) unstable; urgency=low
 
   * Custom built Linux kernel.
 
@@ -143,7 +143,7 @@ EOF
 
 # Generate a control file
 cat <<EOF > debian/control
-Source: linux
+Source: linux-upstream
 Section: base
 Priority: optional
 Maintainer: $maintainer
