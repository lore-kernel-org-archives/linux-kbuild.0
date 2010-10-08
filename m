Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:36568 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751268Ab0JHBff (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Oct 2010 21:35:35 -0400
MIME-Version: 1.0
Date: Thu, 7 Oct 2010 21:35:33 -0400
Message-ID: <AANLkTi=Hc2eWzOQ_xKBYsqfwkkiKGU0v42jUhLQ8K7dU@mail.gmail.com>
Subject: [PATCH 00/33] Staging: Fixed <module-objs> to <module>-y
From: T Dent <tdent48227@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

I patch against the next-20101006 tree.

The patch series replace use of <module>-objs with <module>-y in the
staging directory.

Thanks,

Tracey Dent
