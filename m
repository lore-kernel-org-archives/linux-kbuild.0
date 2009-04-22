Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml105.kpnxchange.com ([195.121.3.9]:59535 "EHLO
	CPSMTPM-EML105.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751342AbZDVWfB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 18:35:01 -0400
Subject: [PATCH 0/14] deb-pkg target improvements
Content-Disposition: inline
From: Frans Pop <elendil@planet.nl>
Date: Thu, 23 Apr 2009 00:34:58 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <200904230034.59627.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

Here's a new patch series with improvements for the deb-pkg target. It's a
compromise that includes both the patches from Maximilian Attems and myself,
with some changes because of comments, a few fixes, and further improvements.

The (new) second patch simplifies some of the later patches quite a bit.

Maximilian's patch to add a copyright file turned out to be incomplete: the
copyright file did not actually get included in the binary packages. This
is fixed in this series.

For patches that are essentially unchanged from Maximilian's earlier set
I've left his Signed-of-by. In cases where I made real changes (the
copyright patch) I've changed that to myself.

The patch series should still be OK for 2.6.30. I've done a fair bit of
testing and in the end the actual impact of the changes is relatively minor.

I still plan to write a doc explaining how the deb-pkg target works if
this patch series is accepted.

Maximilian:
This *is* a compromise. I don't expect you to be completely happy (e.g.
the source package name), but neither am I (I still feel the script is
made more complex than needed for its purpose). I've honestly tried to
find a solution that's acceptable to us both.

Cheers,
FJP

Diffstat:
 scripts/package/builddeb |  149 +++++++++++++++++++++++++++++++--------------
 1 files changed, 102 insertions(+), 47 deletions(-)
