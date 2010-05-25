Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:54928 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757150Ab0EYAvJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 May 2010 20:51:09 -0400
From: Ben Dooks <ben-linux@fluff.org>
Subject: kbuild warning fixes
Date: Tue, 25 May 2010 01:50:58 +0100
Message-Id: <1274748661-15253-1-git-send-email-ben-linux@fluff.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org

couple of fixes to deal with the unused result of fgets().

note sure if they are the best, but they do fix the warnings
without totally throwing the result away.


