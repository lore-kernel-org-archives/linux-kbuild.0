Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:38237 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832Ab1H3EOt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Aug 2011 00:14:49 -0400
Received: by pzk37 with SMTP id 37so9611251pzk.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Aug 2011 21:14:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314662164-8565-3-git-send-email-crquan@gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
	<1314662164-8565-1-git-send-email-crquan@gmail.com>
	<1314662164-8565-2-git-send-email-crquan@gmail.com>
	<1314662164-8565-3-git-send-email-crquan@gmail.com>
Date: Tue, 30 Aug 2011 00:14:48 -0400
Message-ID: <CACqU3MV+ONUEqyhumigkmpDLFbb9BXsuDKygoURwMjsHwcBXWg@mail.gmail.com>
Subject: Re: [PATCH 3/5] scripts/kconfig/nconf: dynamically alloc dialog_input_result
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cheng Renquan <crquan@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Nir Tzachar <nir.tzachar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

Hi,

On Mon, Aug 29, 2011 at 7:56 PM, Cheng Renquan <crquan@gmail.com> wrote:
>  int dialog_inputbox(WINDOW *main_window,
>                const char *title, const char *prompt,
> -               const char *init, char *result, int result_len)
> +               const char *init, char *result, int *result_len)
>  {
This all logic will not work, you need to have the following prototype:

int dialog_inputbox(WINDOW *main_window,
               const char *title, const char *prompt,
               const char *init, char **result, int *result_len)

as realloc(3) will give you a new pointer.

 - Arnaud
