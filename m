Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:55519 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755088Ab3EQK22 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 May 2013 06:28:28 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [RFC] mconf: mark empty menus/menuconfigs different form non-empty ones
Date: Fri, 17 May 2013 12:28:11 +0200
Message-Id: <1368786492-23751-1-git-send-email-dirk@gouders.net>
In-Reply-To: <20130516230404.GB19534@free.fr>
References: <20130516230404.GB19534@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

Hello Yann, all,

here is a patch for the scheme you suggested.

I also tried how it looks if empty submenus are maked by "---|" but I
think that is a matter of personal preferences and I don't want to try to
anticipate what users who use mconf heavily want.

Dirk

