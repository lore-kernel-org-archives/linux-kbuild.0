Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.187]:45421 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751820AbYLJMq5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Dec 2008 07:46:57 -0500
Received: by nf-out-0910.google.com with SMTP id d3so94006nfc.21
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Dec 2008 04:46:55 -0800 (PST)
Message-ID: <493FBA3B.5010801@gmail.com>
Date: Wed, 10 Dec 2008 13:46:51 +0100
From: Jiri Slaby <jirislaby@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] makesystem: revive cscope target
References: <1228911013-25641-1-git-send-email-jirislaby@gmail.com> <20081210124120.GA12784@uranus.ravnborg.org>
In-Reply-To: <20081210124120.GA12784@uranus.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/10/2008 01:41 PM, Sam Ravnborg wrote:
> On Wed, Dec 10, 2008 at 01:10:13PM +0100, Jiri Slaby wrote:
>> - export src and obj, so that we can check them in tags.sh
>> - don't allow * expansion during sh function calls
> 
> What benefit does this patch give us?
> We do not use $obj neither $src in tags.sh.

I'm confused...

git kernel.org:/pub/scm/linux/kernel/git/sam/kbuild-next.git
says:
# Do not use full path is we do not use O=.. builds
if [ ${src} == ${obj} ]; then
        tree=
else
        tree=${srctree}
fi
in scripts/tags.sh.

> Likewise we do not pass it non-expanded parameters.

We do inside the script. Try to touch XYZ.S in your build tree, the tags.sh
won't work then.
