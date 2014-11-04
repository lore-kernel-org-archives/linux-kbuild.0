Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews05.kpnxchange.com ([213.75.39.8]:60753 "EHLO
	cpsmtpb-ews05.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751562AbaKDUIa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 15:08:30 -0500
Message-ID: <1415131708.20372.198.camel@x220>
Subject: Re: [PATCH] xconfig: Don't forget changed string value on focus lost
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 04 Nov 2014 21:08:28 +0100
In-Reply-To: <1415094627-18917-1-git-send-email-syntheticpp@gmx.net>
References: <1415094627-18917-1-git-send-email-syntheticpp@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter =?ISO-8859-1?Q?K=FCmmel?= <syntheticpp@gmx.net>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

On Tue, 2014-11-04 at 10:50 +0100, Peter Kümmel wrote:

Even though I don't use qconf, I think I can say this patch is not
obviously trivial. So, could you please add a few lines describing
current behavior, why it's wrong, and how this patch fixes it? That
might increase the chance this patch gets some review.

> Signed-off-by: Peter Kümmel <syntheticpp@gmx.net>
> ---
>  scripts/kconfig/qconf.cc | 23 +++++++++++++++++++----
>  scripts/kconfig/qconf.h  |  2 ++
>  2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 9d3b04b..f08472e 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -302,13 +302,18 @@ ConfigLineEdit::ConfigLineEdit(ConfigView* parent)
>  	connect(this, SIGNAL(lostFocus()), SLOT(hide()));
>  }
>  
> -void ConfigLineEdit::show(ConfigItem* i)
> +void ConfigLineEdit::updateLineEditText(ConfigItem* i)
>  {
> -	item = i;
> -	if (sym_get_string_value(item->menu->sym))
> -		setText(QString::fromLocal8Bit(sym_get_string_value(item->menu->sym)));
> +	if (sym_get_string_value(i->menu->sym))
> +		setText(QString::fromLocal8Bit(sym_get_string_value(i->menu->sym)));
>  	else
>  		setText(QString::null);
> +}
> +
> +void ConfigLineEdit::show(ConfigItem* i)
> +{
> +	item = i;
> +	updateLineEditText(item);
>  	Parent::show();
>  	setFocus();
>  }
> @@ -317,6 +322,7 @@ void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
>  {
>  	switch (e->key()) {
>  	case Qt::Key_Escape:
> +		updateLineEditText(item);
>  		break;
>  	case Qt::Key_Return:
>  	case Qt::Key_Enter:
> @@ -332,6 +338,15 @@ void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
>  	hide();
>  }
>  
> +void ConfigLineEdit::focusOutEvent(QFocusEvent *e)
> +{
> +	if (e->lostFocus()) {
> +		sym_set_string_value(item->menu->sym, text().latin1());
> +		parent()->updateList(item);
> +	}
> +	Parent::focusOutEvent(e);
> +}
> +
>  ConfigList::ConfigList(ConfigView* p, const char *name)
>  	: Parent(p, name),
>  	  updateAll(false),
> diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
> index bde0c6b..11efb71 100644
> --- a/scripts/kconfig/qconf.h
> +++ b/scripts/kconfig/qconf.h
> @@ -209,8 +209,10 @@ public:
>  	{
>  		return (ConfigView*)Parent::parent();
>  	}
> +	void updateLineEditText(ConfigItem *i);
>  	void show(ConfigItem *i);
>  	void keyPressEvent(QKeyEvent *e);
> +	void focusOutEvent(QFocusEvent *e);
>  
>  public:
>  	ConfigItem *item;

Thanks,


Paul Bolle

