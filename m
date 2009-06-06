Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.177]:50006 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751396AbZFFPZV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 6 Jun 2009 11:25:21 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 18/39] kbuild/headers_check: refine extern check
Date: Sat, 6 Jun 2009 15:25:12 +0000
References: <20090605233720.GA13588@uranus.ravnborg.org> <200906060046.07421.arnd@arndb.de> <20090606083844.GA14555@uranus.ravnborg.org>
In-Reply-To: <20090606083844.GA14555@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200906061525.12876.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Amerigo Wang <amwang@redhat.com>

On Saturday 06 June 2009 08:38:44 am Sam Ravnborg wrote:

> Subject: kbuild/headers_check: refine extern check
> 
> 'extern' checking information is not clear, refine it.
> Plus, fix a comment.

Thanks!
 
> Signed-off-by: WANG Cong <amwang@redhat.com>
> [sam: redid the extern error message]
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
