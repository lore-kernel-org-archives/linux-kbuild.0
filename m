Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nz-out-0506.google.com ([64.233.162.233]:1324 "EHLO
	nz-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751691AbYAXXFJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 18:05:09 -0500
Received: by nz-out-0506.google.com with SMTP id s18so330545nze.1
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jan 2008 15:05:06 -0800 (PST)
Message-ID: <4799199C.50204@gmail.com>
Date: Fri, 25 Jan 2008 08:05:00 +0900
From: Tejun Heo <htejun@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 21/77] kbuild: ignore *.order files
References: <20080124215813.GA4204@uranus.ravnborg.org> <1201212238-4369-21-git-send-email-sam@ravnborg.org>
In-Reply-To: <1201212238-4369-21-git-send-email-sam@ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Sam Ravnborg wrote:
> Introducing the new modules.order patch created a number
> of additional files. Teach git to ignore them.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Tejun Heo <htejun@gmail.com>

Acked-by: Tejun Heo <htejun@gmail.com>

-- 
tejun
