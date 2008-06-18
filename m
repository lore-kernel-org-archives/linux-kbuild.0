Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hpsmtp-eml15.kpnxchange.com ([213.75.38.115]:43180 "EHLO
	hpsmtp-eml15.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753763AbYFRSo4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Jun 2008 14:44:56 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Preserving Kconfig choice when option is renamed
Date: Wed, 18 Jun 2008 20:29:42 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200806182029.43100.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

What would be the correct way to preserve a Kconfig setting for a choice 
field when one of its options has been renamed?

The specific case here is the ARCH_ORION -> ARCH_ORION5X rename in 
arch/arm/Kconfig (commit: 9dd0b194bf68).

I've tried a number of things but keep getting the general default 
(ARCH_VERSATILE), which means various previously selected modules get 
unselected.

Cheers,
FJP
