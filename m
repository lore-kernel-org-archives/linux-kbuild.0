Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:62473 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756235Ab2KVTDQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Nov 2012 14:03:16 -0500
Received: by mail-we0-f174.google.com with SMTP id d7so2107231wer.19
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Nov 2012 11:03:15 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: 
Date: Thu, 22 Nov 2012 01:06:03 +0100
Message-Id: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Michal, All,

This patch series:
  - includes a fix in case the user has CONFIG_ set in the environment
  - allows one to set a custom root-menu label, the same way we handle
    the CONFIG_ prefix

Regards,
Yann E. MORIN.
