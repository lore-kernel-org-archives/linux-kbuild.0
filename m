Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:62087 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752001AbZFFAqW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jun 2009 20:46:22 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 18/39] kbuild/headers_check: refine extern check
Date: Sat, 6 Jun 2009 00:46:07 +0000
References: <20090605233720.GA13588@uranus.ravnborg.org> <1244245377-17441-18-git-send-email-sam@ravnborg.org>
In-Reply-To: <1244245377-17441-18-git-send-email-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200906060046.07421.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Amerigo Wang <amwang@redhat.com>

On Friday 05 June 2009 11:42:36 pm Sam Ravnborg wrote:
> From: Amerigo Wang <amwang@redhat.com>
> 
> 'extern' checking information is not clear, refine it.
> Plus, fix a comment.
> 
> Signed-off-by: WANG Cong <amwang@redhat.com>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

I still think this is pointless and should just be removed
(or replaced with a patch to kill the apostrophe in there).

	Arnd <><
