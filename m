Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60770 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727245AbeJRBCf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 21:02:35 -0400
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 0/3] Let sparse check for shadowed variables
Date: Wed, 17 Oct 2018 19:05:51 +0200
Message-Id: <20181017170554.18841-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, linux-kbuild@vger.kernel.org

#1 enables checking for shadowed variables by sparse. Apparently this is
no longer default as of sparse 0.5.2.
#2 and #3 are just two fixes for what sparse reported. There are plenty
of others…

Sebastian
