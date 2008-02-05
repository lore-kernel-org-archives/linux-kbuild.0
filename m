Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail29.messagelabs.com ([216.82.249.147]:23112 "HELO
	mail29.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754544AbYBEKo4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Feb 2008 05:44:56 -0500
Date: Tue, 5 Feb 2008 11:44:52 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Subject: [PATCH] Add binoffset to gitignore
Message-ID: <20080205104452.GA26460@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>
---
 scripts/.gitignore |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/.gitignore b/scripts/.gitignore
index a1f52cb..b939fbd 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -6,3 +6,4 @@ kallsyms
 pnmtologo
 bin2c
 unifdef
+binoffset
-- 
1.5.3.8


-- 
Uwe Kleine-König, Software Engineer
Digi International GmbH Branch Breisach, Küferstrasse 8, 79206 Breisach, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 13962
